import 'package:flutter/material.dart';

import '../../../../core/UI/presentation/view_model_base.dart';
import '../../../../core/UI/shared/colors.dart';
import '../../../../core/UI/shared/lists.dart';
import '../../../../core/utils/utilities_enums.dart';

class BottomNavigationViewModel extends BaseViewModel {
  int _selectedDrawerIndex = 0;
  int selectedPage = 0;

  List<Widget> _drawerOptions = [];

  get drawerOptions => _drawerOptions;

  /// We use ListQueue to stack visited pages. Generally, Flutter's Navigator does this for us.
  /// But in our case, we are not using navigator so we have to keep our own stack.
  // ListQueue<int> _navStack = ListQueue();

  BottomNavigationViewModel() {
    activityState = ActivityState.isLoading;
    for (int i = 0; i < UILists.drawerItems.length; i++) {
      _drawerOptions.add(
        ListTile(
          key: Key('$i'),
          selected: i == _selectedDrawerIndex,
          leading: Icon(UILists.drawerItems[i].icon, color: UIColors.primaryColor),
          onTap: () => this.navigateTo(UILists.drawerItems[i].screen),
          title: Text(UILists.drawerItems[i].title, style: TextStyle(color: Colors.black)),
        ),
      );
    }
    activityState = ActivityState.isLoaded;
  }
}
