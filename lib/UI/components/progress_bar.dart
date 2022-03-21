import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'dart:math';

// ignore: must_be_immutable
class ProgressBar extends StatelessWidget {
  Gradient gradient;
  int currentValue;
  int step;

  /// • Progress bar for user profile.
  ProgressBar({this.step = 7, this.currentValue = 0, this.gradient});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(gradient: gradient ?? LinearGradient(colors: [Color(0xFFff9a00), Color(0xFFff4d00)])),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  for (int i = 0; i < currentValue; i++) ProgressTile(selected: true),
                  for (int i = 0; i < step - currentValue; i++) ProgressTile(selected: false),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ProgressIcon(
                selected: currentValue >= 0 ? true : false,
                activeColor: Colors.orangeAccent,
                show: true,
                text: 'Profil Durumu: Zayıf Seviye',
              ),
              for (int i = 0; i < (step / 2).ceil() - 1; i++) ProgressIcon(),
              ProgressIcon(
                selected: currentValue >= 4 ? true : false,
                activeColor: Color(0xFFff9800),
                show: true,
                text: 'Profil Durumu: Orta Seviye',
              ),
              for (int i = 0; i < step - (step / 2).ceil() - 1; i++) ProgressIcon(),
              ProgressIcon(
                selected: currentValue >= step ? true : false,
                activeColor: Colors.deepOrange,
                show: true,
                icon: Icons.star_border_outlined,
                text: 'Profil Durumu: Güçlü Seviye',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class ProgressTile extends StatelessWidget {
  bool selected;
  ProgressTile({this.selected = false});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AnimatedContainer(
        width: 50,
        height: 20,
        curve: Curves.fastOutSlowIn,
        duration: const Duration(milliseconds: 700),
        foregroundDecoration:
            BoxDecoration(color: selected ? Colors.transparent : Colors.grey[300], border: Border.all(color: Colors.white)),
      ),
    );
  }
}

// ignore: must_be_immutable
class ProgressIcon extends StatefulWidget {
  bool selected;
  bool show;
  IconData icon;
  Color activeColor;
  String text;

  ProgressIcon({
    this.selected = false,
    this.show = false,
    this.icon = Icons.check,
    this.activeColor = Colors.green,
    this.text = 'Keep Up the Good Work!',
  });

  @override
  State<ProgressIcon> createState() => _ProgressIconState();
}

class _ProgressIconState extends State<ProgressIcon> {
  final ConfettiController _confettiController = ConfettiController(duration: Duration(seconds: 1));

  @override
  void didUpdateWidget(covariant ProgressIcon oldWidget) {
    if (widget.selected && !oldWidget.selected) {
      _confettiController.play();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: widget.show ? 1 : 0,
      child: MediaQuery(
        data: MediaQuery.of(context),
        child: ConfettiWidget(
          confettiController: _confettiController,
          blastDirectionality: BlastDirectionality.explosive,
          createParticlePath: drawStar,
          colors: [Colors.orangeAccent, Color(0xFFff9800), Colors.deepOrange],
          child: widget.show
              ? Tooltip(
                  message: widget.selected ? widget.text : 'Daha çok adım tamamla!',
                  triggerMode: TooltipTriggerMode.tap,
                  decoration: BoxDecoration(
                    color: widget.selected ? widget.activeColor : Colors.grey,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: _getBody())
              : _getBody(),
        ),
      ),
    );
  }

  _getBody() => AnimatedContainer(
        duration: const Duration(milliseconds: 700),
        curve: Curves.fastOutSlowIn,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          border: Border.all(color: widget.selected ? widget.activeColor : Colors.grey, width: 3),
          boxShadow: const [BoxShadow(color: Colors.grey, blurRadius: 2, offset: Offset(1, 1))],
        ),
        child: Icon(widget.icon, size: widget.selected ? 28 : 24, color: widget.selected ? widget.activeColor : Colors.grey),
      );

  Path drawStar(Size size) {
    double degToRad(double deg) => deg * (pi / 180.0);
    const numberOfPoints = 5;
    final halfWidth = size.width / 2;
    final externalRadius = halfWidth;
    final internalRadius = halfWidth / 2.5;
    final degreesPerStep = degToRad(360 / numberOfPoints);
    final halfDegreesPerStep = degreesPerStep / 2;
    final path = Path();
    final fullAngle = degToRad(360);
    path.moveTo(size.width, halfWidth);

    for (double step = 0; step < fullAngle; step += degreesPerStep) {
      path.lineTo(halfWidth + externalRadius * cos(step), halfWidth + externalRadius * sin(step));
      path.lineTo(halfWidth + internalRadius * cos(step + halfDegreesPerStep),
          halfWidth + internalRadius * sin(step + halfDegreesPerStep));
    }
    path.close();
    return path;
  }
}
