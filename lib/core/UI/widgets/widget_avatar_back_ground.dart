import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../models/model_user.dart';
import '../shared/assets.dart';
import '../shared/styles.dart';
import 'gatezero_avatar.dart';

class AvatarBackgroundWidget extends StatelessWidget {
  final String image;
  final UserModel userData;

  AvatarBackgroundWidget({this.image, this.userData});
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Column(
            children: [
              SizedBox(height: 60),
              Container(
                width: double.infinity,
                child: RotatedBox(quarterTurns: 2, child: Lottie.asset(UIAssets.waveGif)),
                decoration: BoxDecoration(borderRadius: BorderRadius.vertical(bottom: Radius.circular(20.0))),
              ),
              Container(
                height: 80,
                width: double.infinity,
                alignment: Alignment.bottomCenter,
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                decoration: BoxDecoration(color: Color(0xFF2872DD), border: Border(top: BorderSide(color: Color(0xFF2872DD)))),
                child: Text(
                  userData.superHero + ' | ' + (userData.level == 0 ? 'Level 1' : 'Level ') + userData.level.toString(),
                  style: UIStyles.titleStyle.copyWith(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
        Column(
          children: [
            GateZeroAvatar(
              size: 170,
              polygonBorder: true,
              image: image,
              fallBackImage: Image.asset(UIAssets.leaderBoardUserIcon, width: 170, height: 170),
            ),
            SizedBox(height: 30),
          ],
        ),
      ],
    );
  }
}
