import 'package:flutter/material.dart';
import 'package:bubble/bubble.dart';

import '../../../services/service_localization.dart';
import '../../../UI/design_materials/DM_assets.dart';
import '../../../UI/design_materials/DM_colors.dart';
import '../../../UI/components/rounded_button.dart';

class QRScreen extends StatefulWidget {
  @override
  QRScreenState createState() => QRScreenState();
}

class QRScreenState extends State<QRScreen> {
  TextStyle _buttonStyle = TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [Padding(padding: EdgeInsets.symmetric(vertical: 20.0), child: _getHeader()), _getQRButton()],
        ),
      ),
    );
  }

  Row _getHeader() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(width: 10),
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.only(top: 35.0),
              child: Image.asset(UIAssets.qrPageMascotImage, height: 220),
            ),
          ),
          Expanded(
            flex: 6,
            child: Bubble(
              nip: BubbleNip.leftBottom,
              padding: BubbleEdges.all(12),
              color: UIColors.primaryColor,
              alignment: Alignment.topRight,
              margin: BubbleEdges.only(top: 10),
              child: Text(LocalizationService.texts.qrScreenGreeting,
                  style: TextStyle(fontSize: 20, color: Colors.white), textAlign: TextAlign.center),
            ),
          ),
          SizedBox(width: 10),
        ],
      );

  Row _getQRButton() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RoundedButton(
            showGradient: true,
            useCustomChild: true,
            margin: EdgeInsets.symmetric(horizontal: 20.0),
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            onPressed: () => Navigator.pushNamed(context, '/screen_interaction'),
            customChild: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(Icons.auto_awesome, color: Colors.white, size: 30),
                SizedBox(width: 15),
                Text("DENEYİME BAŞLA!", textAlign: TextAlign.center, style: _buttonStyle),
              ],
            ),
          ),
        ],
      );
}
