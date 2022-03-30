import 'package:flutter/material.dart';

import 'overflow_handler.dart';

class GateZeroIconButton extends StatelessWidget {
  final Widget icon;
  final String title;
  final double width;
  final Function onPressed;
  final TextStyle textStyle;

  GateZeroIconButton({this.title, this.icon, this.onPressed, this.textStyle, this.width});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 150,
        height: 180,
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [BoxShadow(color: Colors.purple[200], blurRadius: 5, offset: Offset(2, 2))],
        ),
        child: Flex(
          direction: Axis.vertical,
          children: [
            icon ?? Icon(Icons.help, size: 120),
            OverFlowHandler(child: Text(title ?? 'Title', style: textStyle ?? TextStyle(color: Colors.grey, fontSize: 20))),
          ],
        ),
      ),
    );
  }
}
