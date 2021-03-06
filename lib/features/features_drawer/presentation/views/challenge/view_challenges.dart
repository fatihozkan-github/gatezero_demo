import 'package:gatezero_demo/core/UI/presentation/view_base.dart';
import 'package:gatezero_demo/core/UI/presentation/view_model_base.dart';
import 'package:gatezero_demo/core/services/service_localization.dart';
import 'package:speech_balloon/speech_balloon.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import '../../../../../core/UI/shared/assets.dart';
import '../../../../../core/UI/shared/colors.dart';
import '../../../../../core/UI/shared/lists.dart';
import '../../../../../core/UI/shared/styles.dart';
import '../../../../../core/UI/widgets/over_scroll.dart';
import '../../../../../core/UI/widgets/overflow_handler.dart';
import '../../../../../core/router/router.gr.dart';
import '../../../data/models/model_challenge.dart';

class ChallengeView extends StatefulWidget {
  @override
  State<ChallengeView> createState() => _ChallengeViewState();
}

class _ChallengeViewState extends State<ChallengeView> {
  int _currentChallengeStep = 0;
  List<int> _right = [2, 6, 10];

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Timer(Duration(milliseconds: 500), () async => setState(() => _currentChallengeStep = 1));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return BaseView(
      model: BaseViewModel(),
      builder: (_, vm, __) {
        return Scaffold(
          appBar: AppBar(title: OverFlowHandler(child: Text(LocalizationService.texts.drawerItemChallenges))),
          body: OverScroll(
            child: ListView(
              children: [
                // Image.asset(UIAssets.challengeTopImage, fit: BoxFit.fitWidth),
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Image.asset(UIAssets.challengeNewBodyImage, fit: BoxFit.fitWidth),
                    for (ChallengeModel challenge in UILists.challengeList)
                      _getBalloons(width, UILists.challengeList.indexOf(challenge) + 1, challenge, vm),
                    for (int i = 6; i <= 11; i++) _getPlaceholders(width, i),
                    AnimatedPositioned(
                      duration: Duration(seconds: 2),
                      child: Image.asset(UIAssets.challengeHeroIcon, width: width / 10),
                      left: _currentChallengeStep.isOdd
                          ? width / 2 - 35
                          : _right.contains(_currentChallengeStep)
                              ? width - (width / 10) - 40
                              : 40,
                      // top: _currentChallengeStep.isOdd
                      //     ? (_currentChallengeStep * width / 9) - (width / 13) + 25
                      //     : (_currentChallengeStep * width / 8.8),
                      top: _currentChallengeStep.isOdd
                          ? 270 + (_currentChallengeStep * width / 9) - (width / 13) + 25
                          : 270 + (_currentChallengeStep * width / 8.8),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  _getBalloons(double width, int index, ChallengeModel challengeModel, vm) {
    double _size = width / 10;
    List<int> _right = [2, 6, 10];
    return Positioned(
      left: index.isOdd
          ? width / 2 - 25
          : _right.contains(index)
              ? null
              : 3,
      right: _right.contains(index) ? 3 : null,
      // top: index.isOdd ? (index * width / 9) - (width / 13) : (index * width / 8.8),
      top: index.isOdd ? 270 + (index * width / 9) - (width / 13) : 270 + (index * width / 8.8),
      child: GestureDetector(
        onTap: () => _getBottomSheet(context, challengeModel, vm),
        child: SpeechBalloon(
          width: _size,
          height: _size,
          nipHeight: 12,
          color: Colors.purple,
          borderRadius: width / 20,
          nipLocation: index.isOdd
              ? NipLocation.bottom
              : _right.contains(index)
                  ? NipLocation.left
                  : NipLocation.right,
          child: index <= 5
              ? Padding(padding: EdgeInsets.all(2.0), child: Image.asset(challengeModel.challengeIcon))
              : Padding(padding: EdgeInsets.all(2.0), child: Image.asset(UILists.mockChallengeImages[5])),
        ),
      ),
    );
  }

  Positioned _getPlaceholders(double width, int index) {
    double _size = width / 10;
    List<int> _right = [2, 6, 10];
    return Positioned(
      left: index.isOdd
          ? width / 2 - 25
          : _right.contains(index)
              ? null
              : 3,
      right: _right.contains(index) ? 3 : null,
      // top: index.isOdd ? (index * width / 9) - (width / 13) : (index * width / 8.8),
      top: index.isOdd ? 275 + (index * width / 9) - (width / 13) : 275 + (index * width / 8.8),
      child: SpeechBalloon(
        width: _size,
        height: _size,
        nipHeight: 12,
        color: Colors.purple,
        borderRadius: width / 20,
        child: Padding(padding: EdgeInsets.all(2.0), child: Image.asset(UILists.mockChallengeImages[index - 6])),
        nipLocation: index.isOdd
            ? NipLocation.bottom
            : _right.contains(index)
                ? NipLocation.left
                : NipLocation.right,
      ),
    );
  }

  _getBottomSheet(context, ChallengeModel challengeData, BaseViewModel vm) {
    return showModalBottomSheet(
      context: context,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20.0))),
      builder: (context) {
        return Column(
          children: [
            Container(
              height: 60,
              decoration: BoxDecoration(color: UIColors.primaryColor),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(onPressed: () => Navigator.pop(context), icon: Icon(Icons.arrow_back, color: Colors.white)),
                  Text(challengeData.challengeTitle, style: UIStyles.titleStyle.copyWith(color: UIColors.tertiaryColor)),
                  Padding(padding: EdgeInsets.all(8.0), child: Icon(Icons.arrow_back)),
                ],
              ),
            ),
            Expanded(
              child: OverScroll(
                child: ListView(
                  shrinkWrap: true,
                  padding: EdgeInsets.symmetric(horizontal: 12.0),
                  children: [
                    Padding(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        child: Text(challengeData.challengeInfo, textAlign: TextAlign.center)),
                    ClipRRect(borderRadius: BorderRadius.circular(20), child: Image.asset(challengeData.challengeImage)),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(child: Text(LocalizationService.texts.returnButtonText), onPressed: () => Navigator.pop(context)),
                          SizedBox(width: 20),
                          ElevatedButton(
                            child: Text(LocalizationService.texts.acceptButtonText),
                            onPressed: _currentChallengeStep == UILists.challengeList.indexOf(challengeData) + 1
                                ? () => vm.appRouter.push(ChallengeDetailViewRoute(challengeData: challengeData))
                                : null,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
