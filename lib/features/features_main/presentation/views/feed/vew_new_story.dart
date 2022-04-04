import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:matrix_gesture_detector/matrix_gesture_detector.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter/rendering.dart' show ViewportOffset;
import 'package:delayed_display/delayed_display.dart';
import 'package:screenshot/screenshot.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import '../../../../../core/UI/presentation/view_base.dart';
import '../../../../../core/UI/shared/colors.dart';
import '../../../../../core/UI/shared/lists.dart';
import '../../../../../core/UI/shared/utils.dart';
import '../../../../../core/UI/widgets/over_scroll.dart';
import '../../../../../core/router/router.gr.dart';
import '../../../../../core/utils/utilities_constants.dart';
import '../../../../../core/utils/utilities_general.dart';
import '../../view_models/feed/view_model_new_story.dart';

class NewStoryView extends StatefulWidget {
  @override
  State<NewStoryView> createState() => _NewStoryViewState();
}

class _NewStoryViewState extends State<NewStoryView> {
  TextEditingController _textEditingController = TextEditingController();
  ScreenshotController _screenshotController = ScreenshotController();
  FocusNode _focusTextField = FocusNode();
  bool _activeField = false;
  Image _image;

  /// Editing
  Color _currentColor = UIColors.primaryColor;
  Color _pickerColor = UIColors.primaryColor;
  ValueNotifier<Matrix4> notifier = ValueNotifier(Matrix4.identity());

  void writeText() {
    _activeField = true;
    _focusTextField.requestFocus();
    setState(() {});
  }

  /// Filtering
  final List<List<double>> _filters = UILists.filters;
  final _filterColor = ValueNotifier<List<double>>(Constants.NO_FILTER);

  void _onFilterChanged(List<double> value) => _filterColor.value = value;

  void _openGalleryView() async {
    File file = await GeneralUtils.pickImage(src: ImageSource.camera);
    if (file != null) {
      _image = Image.file(file, fit: BoxFit.cover);
      setState(() {});
    } else
      Navigator.pop(context);
  }

  void changeColor(Color color) => setState(() => _pickerColor = color);

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) => _openGalleryView());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BaseView(
      model: NewStoryViewModel(),
      builder: (_, NewStoryViewModel vm, __) {
        return Scaffold(
          backgroundColor: Colors.black,
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: Text('Upload Photo'),
            actions: [
              IconButton(
                icon: Icon(Icons.send),
                onPressed: () async {
                  await _screenshotController.capture().then((value) {
                    if (value != null) {
                      vm.appRouter.push(ShareStoryViewRoute(storyImage: value));
                    } else
                      UIUtils.showToast('Choose picture to continue!');
                  });
                },
              )
            ],
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [_getTextButtons(), if (_image != null) _getStoryEditing(notifier, size)],
          ),
        );
      },
    );
  }

  void showPicker() {
    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(builder: (context, setter) {
        return AlertDialog(
          title: Text('Choose a color!'),
          content: SingleChildScrollView(child: ColorPicker(pickerColor: _pickerColor, onColorChanged: changeColor, labelTypes: [])),
          actions: <Widget>[
            ElevatedButton(
              child: Text('OK'),
              onPressed: () {
                setState(() => _currentColor = _pickerColor);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      }),
    );
  }

  Widget _buildFilterSelector() => FilterSelector(onFilterChanged: _onFilterChanged, filters: _filters, image: _image);

  _getStoryEditing(notifier, size) => Column(
        children: [
          Screenshot(
            controller: _screenshotController,
            child: Stack(
              children: [
                Container(
                  height: size.height / 1.8,
                  width: size.width,
                  child: ValueListenableBuilder(
                    valueListenable: _filterColor,
                    builder: (context, value, child) => ColorFiltered(colorFilter: ColorFilter.matrix(value), child: _image),
                  ),
                ),
                MatrixGestureDetector(
                  onMatrixUpdate: (m, tm, sm, rm) => notifier.value = m,
                  child: AnimatedBuilder(
                    animation: notifier,
                    builder: (ctx, child) {
                      return Container(
                        height: size.height / 1.8,
                        width: size.width,
                        transform: notifier.value,
                        child: Center(
                          child: TextField(
                            readOnly: !_activeField,
                            focusNode: _focusTextField,
                            textAlign: TextAlign.center,
                            cursorColor: UIColors.primaryColor,
                            controller: _textEditingController,
                            enableInteractiveSelection: false,
                            style: TextStyle(color: _currentColor),
                            onEditingComplete: () => setState(() => _activeField = false),
                            decoration: InputDecoration(border: InputBorder.none, contentPadding: EdgeInsets.all(30)),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          _buildFilterSelector(),
        ],
      );

  _getTextButtons() => _image == null
      ? Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              icon: Icon(Icons.add_photo_alternate_rounded, color: Colors.white, size: 50),
              label: Text('Upload Photo', style: TextStyle(color: Colors.white)),
              onPressed: _openGalleryView,
            ),
          ],
        )
      : Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            DelayedDisplay(
              fadeIn: _textEditingController.text.isNotEmpty,
              delay: Duration(milliseconds: 500),
              child: ElevatedButton.icon(
                icon: Icon(Icons.font_download_rounded, color: Colors.white, size: 20),
                label: Text('Choose Color', style: TextStyle(color: Colors.white)),
                onPressed: () async => await showPicker(),
              ),
            ),
            SizedBox(width: 5),
            ElevatedButton(
                child: Icon(Icons.format_color_text_rounded, color: Colors.white, size: 20), onPressed: () async => await writeText()),
            SizedBox(width: 10),
          ],
        );
}

@immutable
class FilterSelector extends StatefulWidget {
  FilterSelector({
    this.filters,
    this.onFilterChanged,
    this.padding = const EdgeInsets.symmetric(vertical: 24.0),
    this.image,
  });

  final List<List<double>> filters;
  final void Function(List<double> selectedMode) onFilterChanged;
  final EdgeInsets padding;
  final Image image;
  @override
  _FilterSelectorState createState() => _FilterSelectorState();
}

class _FilterSelectorState extends State<FilterSelector> {
  static const _filtersPerScreen = 5;
  static const _viewportFractionPerItem = 1.0 / _filtersPerScreen;

  PageController _controller;
  int _page;
  int get filterCount => widget.filters.length;
  List<double> itemColor(int index) => widget.filters[index % filterCount];

  void _onPageChanged() {
    final page = (_controller.page ?? 0).round();
    if (page != _page) {
      _page = page;
      widget.onFilterChanged(widget.filters[page]);
    }
  }

  void _onFilterTapped(int index) => _controller.animateToPage(index, duration: Duration(milliseconds: 450), curve: Curves.ease);

  @override
  void initState() {
    super.initState();
    _page = 0;
    _controller = PageController(initialPage: _page, viewportFraction: _viewportFractionPerItem);
    _controller.addListener(_onPageChanged);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return OverScroll(
      child: Scrollable(
        controller: _controller,
        axisDirection: AxisDirection.right,
        physics: PageScrollPhysics(),
        viewportBuilder: (context, viewportOffset) {
          return LayoutBuilder(
            builder: (context, constraints) {
              final itemSize = constraints.maxWidth * _viewportFractionPerItem;
              viewportOffset
                ..applyViewportDimension(constraints.maxWidth)
                ..applyContentDimensions(0.0, itemSize * (filterCount - 1));

              return Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  _buildShadowGradient(itemSize),
                  _buildCarousel(viewportOffset: viewportOffset, itemSize: itemSize),
                  _buildSelectionRing(itemSize),
                ],
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildShadowGradient(double itemSize) {
    return SizedBox(
      height: itemSize * 2 + widget.padding.vertical,
      child: const DecoratedBox(
        decoration: BoxDecoration(
          gradient:
              LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Colors.transparent, Colors.black]),
        ),
        child: SizedBox.expand(),
      ),
    );
  }

  Widget _buildCarousel({ViewportOffset viewportOffset, double itemSize}) {
    return Container(
      height: itemSize,
      margin: widget.padding,
      child: Flow(
        delegate: CarouselFlowDelegate(viewportOffset: viewportOffset, filtersPerScreen: _filtersPerScreen),
        children: [
          for (int i = 0; i < filterCount; i++)
            FilterItem(onFilterSelected: () => _onFilterTapped(i), blendMode: itemColor(i), image: widget.image),
        ],
      ),
    );
  }

  Widget _buildSelectionRing(double itemSize) {
    return IgnorePointer(
      child: Padding(
        padding: widget.padding,
        child: SizedBox(
          width: itemSize,
          height: itemSize,
          child: DecoratedBox(
              decoration: BoxDecoration(
                  shape: BoxShape.circle, border: Border.fromBorderSide(BorderSide(width: 3.0, color: UIColors.primaryColor)))),
        ),
      ),
    );
  }
}

class CarouselFlowDelegate extends FlowDelegate {
  CarouselFlowDelegate({this.viewportOffset, this.filtersPerScreen}) : super(repaint: viewportOffset);

  final ViewportOffset viewportOffset;
  final int filtersPerScreen;

  @override
  void paintChildren(FlowPaintingContext context) {
    final count = context.childCount;
    final size = context.size.width;
    final itemExtent = size / filtersPerScreen;
    final active = viewportOffset.pixels / itemExtent;
    final min = math.max(0, active.floor() - 3).toInt();
    final max = math.min(count - 1, active.ceil() + 3).toInt();

    for (var index = min; index <= max; index++) {
      final itemXFromCenter = itemExtent * index - viewportOffset.pixels;
      final percentFromCenter = 1.0 - (itemXFromCenter / (size / 2)).abs();
      final itemScale = 0.5 + (percentFromCenter * 0.5);
      final opacity = 0.25 + (percentFromCenter * 0.75);

      final itemTransform = Matrix4.identity()
        ..translate((size - itemExtent) / 2)
        ..translate(itemXFromCenter)
        ..translate(itemExtent / 2, itemExtent / 2)
        ..multiply(Matrix4.diagonal3Values(itemScale, itemScale, 1.0))
        ..translate(-itemExtent / 2, -itemExtent / 2);

      context.paintChild(index, transform: itemTransform, opacity: opacity);
    }
  }

  @override
  bool shouldRepaint(covariant CarouselFlowDelegate oldDelegate) => oldDelegate.viewportOffset != viewportOffset;
}

@immutable
class FilterItem extends StatelessWidget {
  FilterItem({this.blendMode, this.onFilterSelected, this.image});
  final List<double> blendMode;
  final VoidCallback onFilterSelected;
  final Image image;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onFilterSelected,
      child: AspectRatio(
        aspectRatio: 1.0,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: ClipOval(child: ColorFiltered(colorFilter: ColorFilter.matrix(blendMode), child: image)),
        ),
      ),
    );
  }
}
