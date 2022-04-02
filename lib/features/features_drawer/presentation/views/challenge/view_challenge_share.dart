import 'dart:typed_data';

import 'package:gatezero_demo/core/services/service_localization.dart';
import 'package:screenshot/screenshot.dart';
import 'package:flutter/material.dart';

import '../../../../../core/UI/shared/styles.dart';
import '../../../../../core/UI/widgets/async_button.dart';
import '../../../../../core/UI/widgets/over_scroll.dart';
import '../../../../../core/utils/utilities_general.dart';
import '../../../data/models/model_challenge.dart';

class ChallengeShareView extends StatelessWidget {
  final Uint8List imageData;
  final ChallengeModel challengeData;
  ChallengeShareView({@required this.imageData, @required this.challengeData});

  final ScreenshotController _ssController = ScreenshotController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(LocalizationService.texts.shareButtonText)),
      body: OverScroll(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 12.0),
          children: [
            SizedBox(height: 10),
            Screenshot(
              controller: _ssController,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                    child: Image.memory(imageData, errorBuilder: (context, e, trace) => Icon(Icons.error)),
                  ),
                  Container(
                    width: 250,
                    padding: EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
                      gradient: LinearGradient(
                          colors: [Colors.black, Colors.transparent], begin: Alignment.bottomCenter, end: Alignment.topCenter),
                    ),
                    child: Text(
                      'Support me in ${challengeData.challengeTitle} challenge!',
                      style: UIStyles.infoStyle.copyWith(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            AsyncButton(
                label: LocalizationService.texts.shareButtonText,
                onPressed: () async => await GeneralUtils.takeSSandShare(_ssController, ssName: challengeData.challengeTitle)),
          ],
        ),
      ),
    );
  }
}
