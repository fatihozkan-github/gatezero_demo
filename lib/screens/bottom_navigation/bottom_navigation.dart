import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:gatezero_demo/screens/bottom_navigation/screen_feed/screen_feed.dart';
import 'package:gatezero_demo/screens/bottom_navigation/screen_leader_board/screen_leaderboard.dart';
import 'package:gatezero_demo/screens/bottom_navigation/screen_map/screen_map.dart';
import 'package:gatezero_demo/screens/bottom_navigation/screen_prizes/screen_prizes.dart';
import 'package:gatezero_demo/screens/bottom_navigation/screen_qr/screen_qr.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'dart:collection';

import '../../UI/components/overflow_handler.dart';
import '../../UI/components/we_avatar.dart';
import '../../UI/design_materials/DM_assets.dart';
import '../../UI/design_materials/DM_colors.dart';
import '../../UI/design_materials/DM_lists.dart';
import '../../models/model_user.dart';
import '../../providers/provider_user.dart';
import '../../utils/utilities_general.dart';

class BottomNavigation extends StatefulWidget {
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  final _pageOptions = [FeedScreen(), MapScreen(), QRScreen(), PrizesScreen(), LeaderBoardScreen()];

  List<Widget> _drawerOptions = [];
  int _selectedDrawerIndex = 0;
  int selectedPage = 0;

  /// We use ListQueue to stack visited pages. Generally, Flutter's Navigator does this for us.
  /// But in our case, we are not using navigator so we have to keep our own stack.
  ListQueue<int> _navStack = ListQueue();

  /// Finally, we update the state of ConvexAppBar by its key. See [_willPop].
  final GlobalKey<ConvexAppBarState> _convexAppBarKey = GlobalKey<ConvexAppBarState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < UILists.drawerItems.length; i++) {
      _drawerOptions.add(
        ListTile(
          key: Key('$i'),
          selected: i == _selectedDrawerIndex,
          leading: Icon(UILists.drawerItems[i].icon, color: UIColors.primaryColor),
          onTap: () => Navigator.pushNamed(context, UILists.drawerItems[i].screen),
          title: Text(UILists.drawerItems[i].title, style: TextStyle(color: Colors.black)),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: _getAppBar(Provider.of<UserProvider>(context).currentUser),
      body: WillPopScope(onWillPop: _willPop, child: _pageOptions[selectedPage]),
      drawer: _getDrawer(Provider.of<UserProvider>(context).currentUser, _drawerOptions),
      bottomNavigationBar: ConvexAppBar(
        key: _convexAppBarKey,
        onTap: _tapHandler,
        initialActiveIndex: 0,
        activeColor: UIColors.primaryColor,
        items: UILists.bottomNavigationItems,
        backgroundColor: UIColors.primaryColor,
      ),
    );
  }

  _getAppBar(currentUser) => AppBar(
        title: OverFlowHandler(child: Text(UILists.bottomNavigationTitles[selectedPage])),
        leading: IconButton(
          icon: Icon(Icons.bubble_chart_rounded, size: 30),
          onPressed: () => _scaffoldKey.currentState.openDrawer(),
        ),
        actions: [
          if (selectedPage == 1)
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, '/screen_map_feedback'),
              child: Image.asset(UIAssets.mapEventRequestIcon, width: 45),
            ),
          IconButton(
            onPressed: () => Navigator.pushNamed(context, '/screen_profile'),
            icon: WEAvatar(image: currentUser.avatar, size: 35),
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

  _getDrawer(UserModel currentUser, drawerOptions) => Drawer(
        child: Column(
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(color: UIColors.primaryColor),
              child: Row(
                children: [
                  GestureDetector(
                      onTap: () => Navigator.pushNamed(context, '/screen_profile'),
                      child: WEAvatar(image: currentUser.avatar, size: 110)),
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
            ReorderableListView(
              shrinkWrap: true,
              children: _drawerOptions,
              buildDefaultDragHandles: true,
              physics: BouncingScrollPhysics(),
              onReorder: (int oldIndex, int newIndex) {
                setState(() {
                  if (oldIndex < newIndex) {
                    newIndex -= 1;
                  }
                  final Widget item = _drawerOptions.removeAt(oldIndex);
                  _drawerOptions.insert(newIndex, item);
                });
              },
            ),
            // Column(children: drawerOptions),
          ],
        ),
      );
}
