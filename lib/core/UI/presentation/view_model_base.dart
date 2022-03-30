import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:screenshot/screenshot.dart';

import '../../router/router.gr.dart';
import '../../utils/utilities_enums.dart';
import '../../utils/utilities_general.dart';
import '../shared/utils.dart';

class BaseViewModel extends ChangeNotifier {
  ActivityState _activityState = ActivityState.isLoaded;
  AppRouter _appRouter = GetIt.I<AppRouter>();

  get activityState => _activityState;

  set activityState(ActivityState activityState) {
    _activityState = activityState;
    notifyListeners();
  }

  void navigateTo(String path, {RouterAction action, var result}) {
    switch (action) {
      case RouterAction.popAndPush:
        _appRouter.pop();
        _appRouter.pushNamed(path);
        break;
      case RouterAction.pushAndRemove:
        _appRouter.replaceNamed(path);
        break;
      case RouterAction.pop:
        _appRouter.pop();
        break;
      default:
        _appRouter.pushNamed(path);
    }
    notifyListeners();
  }

  void validateForm(GlobalKey<FormState> formKey, {List<TextEditingController> controllers = const [], bool showFeedBack = true}) {
    if (formKey.currentState.validate()) {
      bool _doFieldsHaveText = controllers.every((element) => element.text.isNotEmpty);
      if (_doFieldsHaveText) {
        if (showFeedBack) UIUtils.showToast("Mesajını aldık, en kısa sürede harekete geçeceğiz!", success: true, shortDuration: false);
        FocusManager.instance.primaryFocus.nextFocus();
        controllers.forEach((element) => element.clear());
      }
    }
  }

  void showToast(String msg, {bool shortDuration = true, bool success = null}) => UIUtils.showToast(msg);

  Future<void> shareScreenshot(ScreenshotController ssController) async => await GeneralUtils.takeSSandShare(ssController);
}
