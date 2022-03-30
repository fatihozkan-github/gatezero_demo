import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:gatezero_demo/core/UI/widgets/custom_scaffold.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'dart:collection';

import '../../../../core/UI/presentation/view_base.dart';
import '../../../../core/UI/shared/assets.dart';
import '../../../../core/UI/shared/colors.dart';
import '../../../../core/UI/shared/lists.dart';
import '../../../../core/UI/widgets/overflow_handler.dart';
import '../../../../core/UI/widgets/gatezero_avatar.dart';
import '../../../../core/utils/utilities_general.dart';
import '../../../../models/model_user.dart';
import '../../../../providers/provider_user.dart';
import '../view_models/view_model_bottom_navigation.dart';
import 'feed/view_feed.dart';
import 'leader_board/view_leader_board.dart';
import 'map/view_google_map.dart';
import 'prizes/view_prize.dart';
import 'qr/view_custom_qr.dart';

/// TODO: Revise
class BottomNavigationView extends StatefulWidget {
  @override
  _BottomNavigationViewState createState() => _BottomNavigationViewState();
}

class _BottomNavigationViewState extends State<BottomNavigationView> {
  final _pageOptions = [FeedView(), GoogleMapView(), CustomQRView(), PrizesView(), LeaderBoardView()];

  int selectedPage = 0;

  /// We use ListQueue to stack visited pages. Generally, Flutter's Navigator does this for us.
  /// But in our case, we are not using navigator so we have to keep our own stack.
  ListQueue<int> _navStack = ListQueue();

  /// Finally, we update the state of ConvexAppBar by its key. See [_willPop].
  final GlobalKey<ConvexAppBarState> _convexAppBarKey = GlobalKey<ConvexAppBarState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return BaseView(
      model: BottomNavigationViewModel(),
      builder: (_, BottomNavigationViewModel vm, __) {
        return CustomScaffold(
          activityState: vm.activityState,
          child: Scaffold(
            key: _scaffoldKey,
            appBar: _getAppBar(vm),
            body: WillPopScope(onWillPop: _willPop, child: _pageOptions[selectedPage]),
            drawer: _getDrawer(Provider.of<UserProvider>(context).currentUser, vm),
            bottomNavigationBar: ConvexAppBar(
              key: _convexAppBarKey,
              onTap: _tapHandler,
              initialActiveIndex: 0,
              activeColor: UIColors.primaryColor,
              items: UILists.bottomNavigationItems,
              backgroundColor: UIColors.primaryColor,
            ),
          ),
        );
      },
    );
  }

  _getAppBar(BottomNavigationViewModel vm) => AppBar(
        title: OverFlowHandler(child: Text(UILists.bottomNavigationTitles[selectedPage])),
        leading: IconButton(
          icon: Icon(Icons.bubble_chart_rounded, size: 30),
          onPressed: () => _scaffoldKey.currentState.openDrawer(),
        ),
        actions: [
          if (selectedPage == 1)
            GestureDetector(
              onTap: () => vm.navigateTo('/view_map_feedback'),
              child: Image.asset(UIAssets.mapEventRequestIcon, width: 45),
            ),
          IconButton(
            onPressed: () => vm.navigateTo('/view_profile'),
            icon: GateZeroAvatar(image: Provider.of<UserProvider>(context).currentUser.avatar, size: 35),
          ),
          SizedBox(width: 10),
        ],
      );

  Future<bool> _willPop() async {
    bool returnValue = false;
    if (_scaffoldKey.currentState.isDrawerOpen) {
      Navigator.of(context).pop();
    } else {
      if (_navStack.isEmpty) returnValue = await _showDialog();
      if (_navStack.isNotEmpty) {
        setState(() {
          _navStack.removeLast();
          int position = _navStack.isEmpty ? 0 : _navStack.last;
          selectedPage = position;
          returnValue = false;
        });
      }
    }
    _convexAppBarKey.currentState.tap(selectedPage);
    return returnValue;
  }

  _tapHandler(int index) {
    if (index != selectedPage) {
      if (!_navStack.contains(index)) {
        _navStack.addLast(index);
      }
      setState(() => selectedPage = index);
    }
  }

  _showDialog() async {
    return await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text('Uygulamadan çıkmak istediğine emin misin?', textAlign: TextAlign.center),
          actions: <Widget>[
            ElevatedButton(child: Text('Hayır'), onPressed: () => Navigator.of(context).pop(false)),
            TextButton(child: Text('Evet'), onPressed: () => Navigator.of(context).pop(true)),
          ],
        );
      },
    );
  }

  _getDrawer(UserModel currentUser, BottomNavigationViewModel vm) => Drawer(
        child: Column(
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(color: UIColors.primaryColor),
              child: Row(
                children: [
                  GestureDetector(
                      onTap: () => vm.navigateTo('/view_profile'), child: GateZeroAvatar(image: currentUser.avatar, size: 110)),
                  SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(GeneralUtils.hasData(currentUser.name) ? currentUser.name : 'İsim Girilmedi!',
                            style: TextStyle(color: UIColors.tertiaryColor, fontSize: 19)),
                        SizedBox(height: 5),
                        if (GeneralUtils.hasData(currentUser.superHero))
                          Text(currentUser.superHero, style: TextStyle(color: UIColors.tertiaryColor, fontSize: 16)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Column(children: vm.drawerOptions),
          ],
        ),
      );
}
