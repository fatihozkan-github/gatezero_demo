import 'dart:collection';

import 'package:gatezero_demo/core/utils/utilities_enums.dart';

import '../../../../core/UI/presentation/view_model_base.dart';

class BottomNavigationViewModel extends BaseViewModel {
  int _selectedDrawerIndex = 0;
  int selectedPage = 0;

  /// We use ListQueue to stack visited pages. Generally, Flutter's Navigator does this for us.
  /// But in our case, we are not using navigator so we have to keep our own stack.
  ListQueue<int> _navStack = ListQueue();

  // Future<bool> _willPop() async {
  //   bool returnValue = false;
  //   if (_scaffoldKey.currentState.isDrawerOpen) {
  //     navigateTo('', action: RouterAction.pop);
  //   } else {
  //     if (_navStack.isEmpty) returnValue = await _showDialog();
  //     if (_navStack.isNotEmpty) {
  //       setState(() {
  //         _navStack.removeLast();
  //         int position = _navStack.isEmpty ? 0 : _navStack.last;
  //         selectedPage = position;
  //         returnValue = false;
  //       });
  //     }
  //   }
  //   _convexAppBarKey.currentState.tap(selectedPage);
  //   return returnValue;
  // }
}
