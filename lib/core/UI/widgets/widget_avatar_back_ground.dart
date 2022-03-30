import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../shared/assets.dart';
import 'gatezero_avatar.dart';

class AvatarBackgroundWidget extends StatelessWidget {
  final String image;
  AvatarBackgroundWidget({this.image});
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Column(
          children: [
            SizedBox(height: 60),
            Container(
              height: 73.5,
              child: RotatedBox(quarterTurns: 2, child: Lottie.asset('assets/gifs/wave.json')),
              decoration: BoxDecoration(borderRadius: BorderRadius.vertical(bottom: Radius.circular(20.0))),
            ),
            Container(
              height: 80,
              decoration: BoxDecoration(
                color: Color(0xFF2872DD),
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(20.0)),
              ),
            ),
          ],
        ),
        GateZeroAvatar(
          size: 170,
          polygonBorder: true,
          image: image,
          fallBackImage: Image.asset(UIAssets.leaderBoardUserIcon, width: 170, height: 170),
        ),
      ],
    );
  }
}
