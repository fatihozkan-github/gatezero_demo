import 'package:expandable_widgets/expandable_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../core/UI/shared/mock_lists.dart';
import '../../../../../../core/services/service_localization.dart';
import '../../../../../../providers/provider_user.dart';
import '../../../widgets/duel_bar.dart';

class ActiveDuelsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(body: _getActiveChallenges());

  Widget _getActiveChallenges() => Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Text(LocalizationService.texts.activeDuelsTitle, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 5),
            Expanded(child: ListView(physics: BouncingScrollPhysics(), children: [GetExpandable()])),
          ],
        ),
      );
}

class GetExpandable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6.0),
      child: Expandable(
        elevation: 3,
        showArrowIcon: true,
        padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
        primaryWidget: Expanded(
          child: ListTile(
            title: Text(LocalizationService.texts.duelingWithText + ' Fatih Özkan'),
            subtitle: Text(LocalizationService.texts.duelTimeText + " 27.03"),
          ),
        ),
        secondaryWidget: DuelBar(
          firstParameter: 165,
          secondParameter: 123,
          firstName: 'Aysu Keçeci',
          secondName: 'Fatih Özkan',
          firstAvatar: Provider.of<UserProvider>(context, listen: false).currentUser.avatar,
          secondAvatar: Mocks.avatarFatih,
        ),
      ),
    );
  }
}
