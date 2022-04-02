import 'package:concentric_transition/page_view.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../../../core/UI/presentation/view_base.dart';
import '../../../../core/UI/shared/assets.dart';
import '../view_models/view_model_landing.dart';

class LandingView extends StatefulWidget {
  @override
  _LandingViewState createState() => _LandingViewState();
}

class _LandingViewState extends State<LandingView> {
  Widget _buildLottie(String assetName, {double width = 350}) => Lottie.asset(assetName, width: width);

  List<String> lotties = [
    UIAssets.plasticRecGif,
    UIAssets.plasticRecGif,
    UIAssets.ecologyGif,
    UIAssets.awardGif,
    UIAssets.socialGif,
    UIAssets.confettiGif,
  ];

  List<String> titles = [
    "",
    "Recycle Plastic Waste",
    "Your Effect",
    "Collect Your Rewards!",
    "Follow",
    "Have fun!",
  ];

  List<String> details = [
    "Your Gate to a Zero-Waste Life",
    "You can recycle your waste by using recycling bins.",
    "Follow your positive impact on the environment.",
    "Opportunities and privileges come out!",
    "You can track your friends' activities on GateZero.",
    "You can complete the challenges for more badges and Z-Score and challenge other people to duel for fun.",
  ];

  // "Geri dönüşüm kutularınını kullanarak atıklarını geri dönüştürebilirsin.",
  // "Çevreye olan pozitif etkini takip et.",
  // "Fırsat ve ayrıcalıkların tadını çıkar!",
  // "Arkadaşlarının GateZero'daki hareketlerini takip edebilirsin.",
  // "Daha fazla rozet ve Z-Score kazanmak için meydan okumaları tamamlayabilir ve eğlenmek için diğer insanlarla düello yapabilirsin.",
  @override
  Widget build(BuildContext context) {
    return BaseView(
      model: LandingViewModel(),
      builder: (_, LandingViewModel _vm, __) {
        return Scaffold(
          body: ConcentricPageView(
            onFinish: () => _vm.navigateTo("/view_welcome"),
            itemCount: 5,
            duration: Duration(seconds: 1),
            physics: BouncingScrollPhysics(),
            colors: <Color>[Colors.white, Colors.blue, Colors.white, Colors.blue, Colors.white],
            itemBuilder: (int index, double value) {
              Color fontColor = index % 2 == 0 ? Colors.black : Colors.white;
              return Center(
                child: Column(
                  children: [
                    SizedBox(height: 50),
                    SizedBox(
                      width: 350,
                      height: 350,
                      child: index != 0 ? _buildLottie(lotties[index]) : Image.asset(UIAssets.generalLogoWithText, width: 350),
                    ),
                    index != 0
                        ? Text(
                            titles[index],
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: fontColor),
                          ).padding(vertical: 20.0)
                        : SizedBox(height: 40),
                    Text(details[index], textAlign: TextAlign.center, style: TextStyle(fontSize: 18, color: fontColor)),
                    SizedBox(height: 40),
                  ],
                ).padding(all: 8.0),
              );
            },
          ),
        );
      },
    );
  }
}
