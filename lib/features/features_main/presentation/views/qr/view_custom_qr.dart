import 'dart:math';

import 'package:flutter/material.dart';
import 'package:bubble/bubble.dart';
import 'package:lottie/lottie.dart';

import '../../../../../core/UI/presentation/view_base.dart';
import '../../../../../core/UI/shared/assets.dart';
import '../../../../../core/UI/shared/colors.dart';
import '../../../../../core/UI/widgets/over_scroll.dart';
import '../../../../../core/UI/widgets/rounded_button.dart';
import '../../../../../core/services/service_localization.dart';
import '../../view_models/qr/view_model_custom_qr.dart';

class CustomQRView extends StatefulWidget {
  @override
  CustomQRViewState createState() => CustomQRViewState();
}

class CustomQRViewState extends State<CustomQRView> {
  TextStyle _buttonStyle = TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return BaseView(
        model: CustomQRViewModel(),
        builder: (_, CustomQRViewModel vm, __) {
          return Scaffold(
            body: OverScroll(
              child: ListView(
                children: [
                  Padding(padding: EdgeInsets.symmetric(vertical: 10.0), child: _getHeader()),
                  SizedBox(height: 50),
                  Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Row(
                        children: [
                          Expanded(child: Lottie.asset(UIAssets.starfallGif)),
                          Expanded(child: Lottie.asset(UIAssets.starfallGif)),
                        ],
                      ),
                      Lottie.asset(UIAssets.portalBaseGif, width: MediaQuery.of(context).size.width),
                      Row(mainAxisAlignment: MainAxisAlignment.center, children: [_getQRButton(vm)]),
                    ],
                  ),
                ],
              ),
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
            child: Padding(padding: const EdgeInsets.only(top: 25.0), child: Image.asset(UIAssets.qrPageMascotImage, height: 220)),
          ),
          Expanded(
            flex: 6,
            child: Bubble(
              nip: BubbleNip.leftBottom,
              padding: BubbleEdges.all(12),
              color: UIColors.primaryColor,
              alignment: Alignment.topRight,
              margin: BubbleEdges.only(top: 5),
              child: Text(LocalizationService.texts.qrScreenGreeting,
                  style: TextStyle(fontSize: 20, color: Colors.white), textAlign: TextAlign.center),
            ),
          ),
          SizedBox(width: 10),
        ],
      );

  RoundedButton _getQRButton(CustomQRViewModel vm) => RoundedButton(
        showGradient: true,
        useCustomChild: true,
        margin: EdgeInsets.symmetric(horizontal: 0.0),
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        onPressed: () => vm.navigateTo('/view_read_qr'),
        customChild: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Transform(
              transform: Matrix4.rotationZ(pi),
              alignment: Alignment.center,
              child: Icon(Icons.auto_awesome, color: Colors.white, size: 30),
            ),
            SizedBox(width: 10),
            Text("Let's Start\nMagical Recycling", textAlign: TextAlign.center, style: _buttonStyle),
            SizedBox(width: 10),
            Icon(Icons.auto_awesome, color: Colors.white, size: 30),
          ],
        ),
      );
}
