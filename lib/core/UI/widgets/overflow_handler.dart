import 'package:flutter/material.dart';

import 'over_scroll.dart';

class OverFlowHandler extends StatefulWidget {
  final Widget child;
  final Axis direction;
  final double initialScrollOffset;
  final Duration animationDuration, backDuration, pauseDuration;

  /// • This widget automatically detects if a text widget reaches its overflow limit and makes the text slide.
  ///
  /// • [child] parameter is required.
  OverFlowHandler({
    @required this.child,
    this.initialScrollOffset = 0,
    this.direction = Axis.horizontal,
    this.pauseDuration = const Duration(seconds: 1),
    this.animationDuration = const Duration(seconds: 4),
    this.backDuration = const Duration(milliseconds: 800),
  });

  @override
  _OverFlowHandlerState createState() => _OverFlowHandlerState();
}

class _OverFlowHandlerState extends State<OverFlowHandler> {
  ScrollController scrollController;

  void scroll(_) async {
    while (scrollController.hasClients) {
      await Future.delayed(widget.pauseDuration);
      if (scrollController.hasClients)
        await scrollController.animateTo(scrollController.position.maxScrollExtent,
            duration: widget.animationDuration, curve: Curves.ease);
      await Future.delayed(widget.pauseDuration);
      if (scrollController.hasClients) await scrollController.animateTo(0.0, duration: widget.backDuration, curve: Curves.easeOut);
    }
  }

  @override
  void initState() {
    scrollController = ScrollController(initialScrollOffset: widget.initialScrollOffset ?? 0.0);
    WidgetsBinding.instance.addPostFrameCallback(scroll);
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return OverScroll(
      child: SingleChildScrollView(child: widget.child, scrollDirection: widget.direction, controller: scrollController),
    );
  }
}
