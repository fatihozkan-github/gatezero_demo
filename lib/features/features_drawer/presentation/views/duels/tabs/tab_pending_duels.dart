import 'package:flutter/material.dart';

import '../../../../../../core/UI/shared/assets.dart';
import '../../../../../../core/UI/shared/mock_lists.dart';
import '../../../../../../core/UI/widgets/gatezero_avatar.dart';
import '../../../../../../core/services/service_localization.dart';

class PendingDuelsTab extends StatefulWidget {
  @override
  State<PendingDuelsTab> createState() => _PendingDuelsTabState();
}

class _PendingDuelsTabState extends State<PendingDuelsTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            Text(LocalizationService.texts.duelInvitesTitle, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Expanded(
              child: ListView(
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 12.0),
                children: [
                  SizedBox(height: 10),
                  Container(
                    height: 100,
                    margin: EdgeInsets.symmetric(vertical: 4.0),
                    decoration: BoxDecoration(color: Colors.orange.withOpacity(0.05), borderRadius: BorderRadius.circular(15.0)),
                    child: ListTile(
                      leading: GateZeroAvatar(image: Mocks.avatarFatih, fallBackImage: Image.asset(UIAssets.leaderBoardUserIcon)),
                      title: Text('Fatih Özkan ' + LocalizationService.texts.challengedText),
                      subtitle:
                          Text(LocalizationService.texts.waitingForDuelInviteResponse, maxLines: 3, overflow: TextOverflow.ellipsis),
                    ),
                  ),
                ],
              ),
            ),
            Text(LocalizationService.texts.incomingDuelInvitations, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Expanded(
              child: ListView(
                physics: BouncingScrollPhysics(),
                children: [SizedBox(height: 10), Text(LocalizationService.texts.doNotHaveDuelInvite, textAlign: TextAlign.center)],
              ),
            )
          ],
        ),
      ),
    );
  }
}
