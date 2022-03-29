import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import '../../services/service_localization.dart';
import 'colors.dart';

class UIUtils {
  static void showToast(String message, {bool shortDuration = true, bool success = null}) {
    Fluttertoast.showToast(
      msg: message,
      gravity: ToastGravity.BOTTOM,
      textColor: UIColors.tertiaryColor,
      timeInSecForIosWeb: shortDuration ? 2 : 5,
      toastLength: shortDuration ? Toast.LENGTH_SHORT : Toast.LENGTH_LONG,
      backgroundColor: success == null
          ? UIColors.primaryColor
          : success
              ? Colors.green
              : Colors.redAccent,
    );
  }

  static void showSnackBar({GlobalKey<ScaffoldMessengerState> scaffoldKey, String message}) {
    scaffoldKey.currentState.showSnackBar(
      SnackBar(content: Text(message), backgroundColor: UIColors.primaryColor, duration: Duration(seconds: 2)),
    );
  }

  static Future<Widget> showGenericPopUp(context, {String title, String subTitle, bool showBackButton = false}) async {
    return await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title ?? LocalizationService.texts.informationTitle),
          content: Text(subTitle ?? LocalizationService.texts.informationComingSoon),
          actions: [
            if (showBackButton)
              TextButton(child: Text(LocalizationService.texts.cancelButtonText), onPressed: () => Navigator.pop(context)),
            ElevatedButton(child: Text(LocalizationService.texts.acceptButtonText), onPressed: () => Navigator.pop(context)),
          ],
        );
      },
    );
  }
}
