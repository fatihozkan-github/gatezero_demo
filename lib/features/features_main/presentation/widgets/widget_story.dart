import 'package:stories_for_flutter/stories_for_flutter.dart';
import 'package:flutter/material.dart';

import '../../../../core/UI/shared/assets.dart';
import '../../../../core/UI/shared/colors.dart';
import '../../../../core/utils/utilities_general.dart';
import '../../../../models/model_story.dart';

class StoryWidget extends StatelessWidget {
  final StoryModel storyData;
  StoryWidget({this.storyData});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.0),
      child: Stories(
        showStoryName: false,
        displayProgress: true,
        fullpageThumbnailSize: 50,
        highLightColor: UIColors.primaryColor,
        autoPlayDuration: Duration(seconds: 4),
        storyStatusBarColor: UIColors.primaryColor,
        fullpageVisitedColor: UIColors.primaryColor,
        fullPagetitleStyle: TextStyle(color: UIColors.primaryColor, fontSize: 20, fontWeight: FontWeight.bold),
        storyItemList: [
          StoryItem(
            name: storyData.publisherName,
            thumbnail: GeneralUtils.hasData(storyData?.thumbNailImage)
                ? AssetImage(storyData?.thumbNailImage)
                : AssetImage(UIAssets.leaderBoardUserIcon),
            stories: [
              Scaffold(
                backgroundColor: Colors.black,
                body: Center(
                  child: storyData?.image != null
                      ? Image.memory(storyData.image)
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(UIAssets.generalLogo),
                            SizedBox(height: 10),
                            Text("GateZero'ya Hoş Geldin!", style: TextStyle(fontSize: 25, color: Colors.white)),
                          ],
                        ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
