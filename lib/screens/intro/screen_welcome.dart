import '../../UI/design_materials/DM_assets.dart';
import '../../UI/design_materials/DM_colors.dart';
import '../../services/service_localization.dart';
import '../../UI/components/rounded_button.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 12.0),
        children: <Widget>[
          SizedBox(height: 150),
          Text(
            LocalizationService.texts.welcomePageTitle,
            style: TextStyle(fontWeight: FontWeight.bold, color: UIColors.primaryColor, fontSize: 32),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 50),
          Image.asset(UIAssets.generalLogo, height: 200, width: 200),
          SizedBox(height: 50),
          RoundedButton(
            text: 'HADİ BAŞLAYALIM!',
            onPressed: () => Navigator.pushNamed(context, '/bottom_navigation'),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
