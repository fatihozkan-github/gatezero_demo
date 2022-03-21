import 'package:concentric_transition/page_view.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../UI/design_materials/DM_assets.dart';

class LandingScreen extends StatefulWidget {
  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
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
    "title0",
    "Plastik Atıklarını Geri Dönüştür",
    "Senin Etkin",
    "Ödüllerini Topla!",
    "Takip Et",
    "Eğlen!",
  ];

  List<String> details = [
    "giriş cümlesi",
    "Geri dönüşüm kutularınını kullanarak atıklarını geri dönüştürebilirsin.",
    "Çevreye olan pozitif etkini takip et.",
    "Fırsat ve ayrıcalıkların tadını çıkar!",
    "Arkadaşlarının GateZero'daki hareketlerini takip edebilirsin.",
    "Daha fazla rozet ve Z-Score kazanmak için meydan okumaları tamamlayabilir ve eğlenmek için diğer insanlarla düello yapabilirsin.",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ConcentricPageView(
        itemCount: 5,
        duration: Duration(seconds: 1),
        physics: BouncingScrollPhysics(),
        colors: <Color>[Colors.white, Colors.blue, Colors.white, Colors.blue, Colors.white],
        onFinish: () => Navigator.pushNamed(context, '/screen_welcome'),
        itemBuilder: (int index, double value) {
          Color fontColor = index % 2 == 0 ? Colors.black : Colors.white;
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SizedBox(height: 50),
                  SizedBox(width: 350, height: 350, child: _buildLottie(lotties[index])),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Text(
                      titles[index],
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: fontColor),
                    ),
                  ),
                  Text(details[index], textAlign: TextAlign.center, style: TextStyle(fontSize: 18, color: fontColor)),
                  SizedBox(height: 40),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
