import '../../UI/design_materials/DM_assets.dart';
import '../../UI/design_materials/DM_styles.dart';
import '../../services/service_localization.dart';
import '../../utils/utilities_general.dart';
import 'package:flutter/material.dart';

class InviteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
            onPressed: () async => GeneralUtils.copyToClipBoard("0zDILq"),
            style: ElevatedButton.styleFrom(shape: StadiumBorder(), padding: EdgeInsets.symmetric(vertical: 15)),
          ),
          SizedBox(height: 7),
          Text(LocalizationService.texts.invitePageHintText, style: UIStyles.hintStyle, textAlign: TextAlign.right),
        ],
      ),
    );
  }
}
