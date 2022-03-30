import 'package:flutter/material.dart';

import '../../../../core/UI/presentation/view_base.dart';
import '../../../../core/UI/shared/assets.dart';
import '../../../../core/UI/shared/styles.dart';
import '../../../../core/services/service_localization.dart';
import '../view_models/view_model_invite.dart';

class InviteView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView(
        model: InviteViewModel(),
        builder: (_, InviteViewModel vm, __) {
          return Scaffold(
            appBar: AppBar(title: Text(LocalizationService.texts.drawerItemInvite)),
            body: ListView(
              padding: EdgeInsets.symmetric(horizontal: 12.0),
              children: [
                SizedBox(height: 40),
                Text(LocalizationService.texts.invitePageText, style: TextStyle(fontSize: 18), textAlign: TextAlign.center),
                Padding(padding: EdgeInsets.all(20.0), child: Image.asset(UIAssets.invitePageImage, width: 180)),
                ElevatedButton(
                  child: Text("0zDILq", style: UIStyles.appBarTitleStyle),
                  onPressed: () async => vm.copyToClipBoard("0zDILq"),
                  style: ElevatedButton.styleFrom(shape: StadiumBorder(), padding: EdgeInsets.symmetric(vertical: 15)),
                ),
                SizedBox(height: 7),
                Text(LocalizationService.texts.invitePageHintText, style: UIStyles.hintStyle, textAlign: TextAlign.right),
              ],
            ),
          );
        });
  }
}
