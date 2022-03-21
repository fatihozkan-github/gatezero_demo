import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';

import '../design_materials/DM_colors.dart';

class WETimer extends StatelessWidget {
  final Key key;
  final double size;
  final int duration;
  final bool isReverse;
  final Function onStart;
  final double strokeWidth;
  final Function onComplete;
  final TextStyle textStyle;
  final CountDownController controller;

  WETimer({
    this.key,
    this.size,
    this.onStart,
    this.textStyle,
    this.onComplete,
    this.controller,
    this.duration = 10,
    this.isReverse = false,
    this.strokeWidth = 20.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircularCountDownTimer(
      width: size,
      height: size,
      autoStart: true,
      isReverse: isReverse,
      onStart: onStart,
      duration: duration,
      strokeWidth: strokeWidth,
      ringGradient: null,
      fillGradient: null,
      initialDuration: 0,
      onComplete: onComplete,
      controller: controller,
      isTimerTextShown: true,
      backgroundGradient: null,
      isReverseAnimation: false,
      strokeCap: StrokeCap.round,
      ringColor: Colors.grey[300],
      textFormat: CountdownTextFormat.S,
      backgroundColor: UIColors.primaryColor,
      fillColor: UIColors.primaryColor.withOpacity(0.5),
      textStyle: textStyle ?? TextStyle(fontSize: 33.0, color: Colors.white, fontWeight: FontWeight.bold),
    );
  }
}
