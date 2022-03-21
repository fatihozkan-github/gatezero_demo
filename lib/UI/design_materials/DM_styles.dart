import 'package:introduction_screen/introduction_screen.dart';
import 'package:flutter/material.dart';

import 'DM_colors.dart';

class UIStyles {
  /// • Font Styles
  static TextStyle hintStyle = TextStyle(color: Colors.grey, fontSize: 12);
  static TextStyle infoStyle = TextStyle(color: Colors.black, fontSize: 16);
  static TextStyle titleStyle = TextStyle(fontSize: 18, fontWeight: FontWeight.bold);
  static TextStyle tabTitleStyle = TextStyle(fontSize: 14, fontWeight: FontWeight.bold);
  static TextStyle appBarTitleStyle = TextStyle(color: UIColors.tertiaryColor, fontSize: 26, fontWeight: FontWeight.bold);

  /// • Component Styles
  static PageDecoration initialPageDecoration = PageDecoration(
    pageColor: Colors.white,
    titlePadding: EdgeInsets.only(top: 50),
    imagePadding: EdgeInsets.only(top: 50),
    descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
    bodyTextStyle: TextStyle(fontSize: 19.0, color: UIColors.secondaryColor),
    titleTextStyle: TextStyle(color: UIColors.secondaryColor, fontSize: 28.0, fontWeight: FontWeight.w700),
  );

  static PageDecoration pageDecoration = PageDecoration(
    pageColor: Colors.white,
    titlePadding: EdgeInsets.only(top: 50),
    imagePadding: EdgeInsets.only(top: 50),
    descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
    bodyTextStyle: TextStyle(fontSize: 19.0, color: UIColors.secondaryColor),
    titleTextStyle: TextStyle(color: UIColors.secondaryColor, fontSize: 28.0, fontWeight: FontWeight.w700),
  );
}
