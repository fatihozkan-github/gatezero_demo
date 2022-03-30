import 'package:gatezero_demo/core/UI/shared/assets.dart';
import 'package:gatezero_demo/core/UI/shared/colors.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class StatisticsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: UIColors.fillColor,
      appBar: AppBar(
        title: Text(
          "İstatistikler",
          style: TextStyle(color: UIColors.primaryColor, fontSize: 26, fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
        foregroundColor: UIColors.primaryColor,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Container(
            width: size.width,
            height: size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(alignment: Alignment.centerRight, child: Lottie.asset(UIAssets.backgroundWave1Gif, width: size.width / 1.5)),
                Align(alignment: Alignment.centerLeft, child: Lottie.asset(UIAssets.backgroundWave2Gif, width: size.width / 1.5)),
              ],
            ),
          ),
          ListView(
            physics: const PageScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            children: [
              Container(
                width: size.width,
                height: size.height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Lottie.asset(UIAssets.presentationGif, width: size.width / 1.5),
                    SizedBox(height: 50),
                    Text("test"),
                  ],
                ),
              ),
              Container(
                width: size.width,
                height: size.height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Lottie.asset(UIAssets.presentationGif, width: size.width / 1.5),
                    SizedBox(height: 50),
                    Text("test"),
                  ],
                ),
              ),
              Container(
                width: size.width,
                height: size.height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Lottie.asset(UIAssets.presentationGif, width: size.width / 1.5),
                    SizedBox(height: 50),
                    Text("test"),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
