import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../router/router.gr.dart';
import '../../utils/utilities_enums.dart';

class BaseViewModel extends ChangeNotifier {
  ActivityState _activityState = ActivityState.isLoaded;
  AppRouter _appRouter = GetIt.I<AppRouter>();

  get activityState => _activityState;

  setActivityState(ActivityState activityState) {
    _activityState = activityState;
    notifyListeners();
  }

  navigateTo(String path, {RouterAction action, var result}) {
    switch (action) {
      case RouterAction.popAndPush:
        print("handle this case!");
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
}
