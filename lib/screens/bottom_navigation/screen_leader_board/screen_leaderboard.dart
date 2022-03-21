import 'package:gatezero_demo/screens/bottom_navigation/screen_leader_board/tabs/tab_leader_board.dart';
import 'package:gatezero_demo/screens/bottom_navigation/screen_leader_board/tabs/tab_friends.dart';
import 'package:flutter/material.dart';

import '../../../UI/design_materials/DM_colors.dart';
import '../../../UI/design_materials/DM_styles.dart';
import '../../../services/service_localization.dart';

class LeaderBoardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            Container(
              color: Colors.white,
              height: 50,
              child: TabBar(
                labelColor: UIColors.primaryColor,
                unselectedLabelColor: Colors.black,
                indicatorColor: UIColors.primaryColor,
                tabs: [
                  Tab(child: Text(LocalizationService.texts.leaderBoardTabTitle1, style: UIStyles.tabTitleStyle)),
                  Tab(child: Text(LocalizationService.texts.leaderBoardTabTitle2, style: UIStyles.tabTitleStyle)),
                ],
              ),
            ),
            Expanded(child: TabBarView(children: [LeaderBoardTab(), FriendsTab()]))
          ],
        ),
      ),
    );
  }
}
