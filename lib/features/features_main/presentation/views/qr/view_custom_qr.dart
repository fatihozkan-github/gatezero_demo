import 'package:flutter/material.dart';
import 'package:bubble/bubble.dart';

import '../../../../../core/UI/presentation/view_base.dart';
import '../../../../../core/UI/shared/assets.dart';
import '../../../../../core/UI/shared/colors.dart';
import '../../../../../core/UI/widgets/rounded_button.dart';
import '../../../../../core/services/service_localization.dart';
import '../../view_models/qr/view_model_custom_qr.dart';

class CustomQRView extends StatefulWidget {
  @override
  CustomQRViewState createState() => CustomQRViewState();
}

class CustomQRViewState extends State<CustomQRView> {
  TextStyle _buttonStyle = TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return BaseView(
        model: CustomQRViewModel(),
        builder: (_, CustomQRViewModel vm, __) {
          return Scaffold(
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(padding: EdgeInsets.symmetric(vertical: 50.0), child: _getHeader()),
                _getQRButton(vm),
                SizedBox(height: 70),
              ],
            ),
          );
        });
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

  Row _getQRButton(CustomQRViewModel vm) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RoundedButton(
            showGradient: true,
            useCustomChild: true,
            margin: EdgeInsets.symmetric(horizontal: 20.0),
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            onPressed: () => vm.navigateTo('/view_read_qr'),
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
