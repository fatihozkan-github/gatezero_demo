import 'package:screenshot/screenshot.dart';
import 'package:flutter/material.dart';

import '../../../UI/design_materials/DM_styles.dart';
import '../../../UI/components/async_button.dart';
import '../../../UI/components/over_scroll.dart';
import '../../../utils/utilities_arguments.dart';
import '../../../utils/utilities_general.dart';

class ChallengeShareScreen extends StatelessWidget {
  final ScreenshotController _ssController = ScreenshotController();
  @override
  Widget build(BuildContext context) {
    ChallengeShareDetailScreenArgs args = ModalRoute.of(context).settings.arguments as ChallengeShareDetailScreenArgs;
    return Scaffold(
      appBar: AppBar(title: Text('Paylaş!')),
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
                    child: Image.memory(args.imageData, errorBuilder: (context, e, trace) => Icon(Icons.error)),
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
                      '${args.challengeData.challengeTitle} mücadelesine ortak ol!',
                      style: UIStyles.infoStyle.copyWith(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            AsyncButton(
                label: 'PAYLAŞ',
                onPressed: () async => await GeneralUtils.takeSSandShare(_ssController, ssName: args.challengeData.challengeTitle)),
          ],
        ),
      ),
    );
  }
}
