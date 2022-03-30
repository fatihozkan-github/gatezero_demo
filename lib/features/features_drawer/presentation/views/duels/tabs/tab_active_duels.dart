import 'package:gatezero_demo/core/UI/shared/mock_lists.dart';
import 'package:expandable_widgets/expandable_widgets.dart';
import 'package:gatezero_demo/providers/provider_user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
            Text('Aktif Düellolarım', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
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
            title: Text('Fatih Özkan ile düellodasın!'),
            subtitle: Text("27.03 tarihine kadar mücadele et!"),
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
