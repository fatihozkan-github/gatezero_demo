import 'package:flutter/material.dart';

import '../../../../../core/UI/shared/colors.dart';
import '../../../../../core/UI/shared/styles.dart';
import '../../../../../core/services/service_localization.dart';
import 'tabs/tab_active_duels.dart';
import 'tabs/tab_pending_duels.dart';

class DuelView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(LocalizationService.texts.drawerItemChallenges)),
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            Container(
              height: 50,
              color: Colors.white,
              child: TabBar(
                labelColor: UIColors.primaryColor,
                unselectedLabelColor: Colors.black,
                indicatorColor: UIColors.primaryColor,
                tabs: [
                  Tab(child: Text(LocalizationService.texts.duelInvitesTitle, style: UIStyles.tabTitleStyle)),
                  Tab(child: Text(LocalizationService.texts.activeDuelsTitle, style: UIStyles.tabTitleStyle)),
                ],
              ),
            ),
            Expanded(child: TabBarView(physics: BouncingScrollPhysics(), children: [PendingDuelsTab(), ActiveDuelsTab()]))
          ],
        ),
      ),
    );
  }
}
