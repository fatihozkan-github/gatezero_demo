import 'package:flutter/material.dart';

import '../design_materials/DM_colors.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  final Color color, textColor;
  final bool showGradient;
  final Gradient gradient;
  final bool useCustomChild;
  final Widget customChild;
  final BoxConstraints constraints;
  final BorderRadius borderRadius;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final ButtonStyle style;

  const RoundedButton({
    Key key,
    this.text = '',
    this.onPressed,
    this.color = UIColors.primaryColor,
    this.textColor = Colors.white,
    this.gradient,
    this.showGradient = false,
    this.useCustomChild = false,
    this.customChild,
    this.constraints,
    this.borderRadius,
    this.margin,
    this.padding,
    this.style,
  })  : assert(useCustomChild == false || customChild != null, '\nIf useCustomChild parameter is true, then set a custom child.'),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: constraints,
      margin: margin ?? EdgeInsets.zero,
      decoration: BoxDecoration(
        borderRadius: borderRadius ?? BorderRadius.circular(20),
        gradient: showGradient ? gradient ?? LinearGradient(colors: [Color(0xFFff4d00), Color(0xFFff9a00)]) : null,
      ),
      child: TextButton(
        onPressed: onPressed,
        child: useCustomChild ? customChild : Text(text, style: TextStyle(color: textColor)),
        style: style ??
            ButtonStyle(
              padding: MaterialStateProperty.all(padding ?? EdgeInsets.symmetric(vertical: 20.0)),
              backgroundColor: MaterialStateProperty.all(showGradient ? Colors.transparent : color),
              overlayColor: MaterialStateProperty.all(Colors.black54.withOpacity(0.1)),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: borderRadius ?? BorderRadius.circular(20))),
            ),
      ),
    );
  }
}
