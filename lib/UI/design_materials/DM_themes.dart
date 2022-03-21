// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'DM_colors.dart';
import 'DM_styles.dart';

class UIThemes {
  static ThemeData lightTheme = ThemeData(
    accentColor: UIColors.primaryColor,
    primaryColor: UIColors.primaryColor,
    fontFamily: "MontserratAlternates",
    visualDensity: VisualDensity.adaptivePlatformDensity,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: UIColors.primaryColor,
      titleTextStyle: UIStyles.appBarTitleStyle.copyWith(fontFamily: "MontserratAlternates"),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.all(UIColors.primaryColor.withOpacity(0.1)),
        foregroundColor: MaterialStateProperty.all(Colors.black),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(style: ElevatedButton.styleFrom(primary: UIColors.primaryColor)),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        primary: UIColors.primaryColor,
        side: BorderSide(color: UIColors.primaryColor),
        padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 12.0),
      ),
    ),
    pageTransitionsTheme: PageTransitionsTheme(
      builders: {
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      },
    ),
    iconTheme: IconThemeData(color: UIColors.primaryColor),
    dialogTheme: DialogTheme(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0))),
    tooltipTheme: TooltipThemeData(
      triggerMode: TooltipTriggerMode.manual,
      decoration: BoxDecoration(color: UIColors.primaryColor, borderRadius: BorderRadius.circular(15.0)),
      verticalOffset: 30,
    ),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: UIColors.primaryColor,
      selectionHandleColor: UIColors.primaryColor,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    fontFamily: "MontserratAlternates",
    visualDensity: VisualDensity.adaptivePlatformDensity,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      titleTextStyle: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, fontFamily: "MontserratAlternates"),
    ),
    pageTransitionsTheme: PageTransitionsTheme(
      builders: {
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      },
    ),
  );
}
