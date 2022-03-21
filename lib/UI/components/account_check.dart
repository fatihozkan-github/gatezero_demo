import 'package:gatezero_demo/UI/design_materials/DM_colors.dart';
import 'package:gatezero_demo/services/service_localization.dart';
import 'package:flutter/material.dart';

/// • Account check template for login & sign up pages
class AccountCheck extends StatelessWidget {
  final String targetPage;
  final bool isLoginPage;

  AccountCheck({this.isLoginPage = true, this.targetPage});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            isLoginPage ? LocalizationService.texts.noAccountQuestion : LocalizationService.texts.accountQuestion,
            style: TextStyle(color: UIColors.primaryColor),
          ),
          GestureDetector(
            onTap: () => Navigator.pushReplacementNamed(context, targetPage),
            child: Text(
              isLoginPage ? LocalizationService.texts.signUpButtonText : LocalizationService.texts.loginButtonText,
              style: TextStyle(color: UIColors.primaryColor, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
