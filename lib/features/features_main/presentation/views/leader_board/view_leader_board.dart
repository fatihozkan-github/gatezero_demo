import 'package:flutter/material.dart';
import 'package:gatezero_demo/core/UI/presentation/view_base.dart';
import 'package:gatezero_demo/core/UI/presentation/view_model_base.dart';

import '../../../../../core/UI/shared/colors.dart';
import '../../../../../core/UI/shared/styles.dart';
import '../../../../../core/services/service_localization.dart';
import 'tabs/tab_friends.dart';
import 'tabs/tab_leader_board.dart';

class LeaderBoardView extends StatelessWidget {
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
