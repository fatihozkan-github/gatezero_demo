import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:gatezero_demo/core/UI/presentation/view_base.dart';
import 'package:gatezero_demo/core/UI/presentation/view_model_base.dart';
import 'package:gatezero_demo/core/services/service_localization.dart';
import 'package:gatezero_demo/providers/provider_feed.dart';
import 'package:gatezero_demo/providers/provider_user.dart';
import 'package:provider/provider.dart';

import '../../../../../core/UI/widgets/async_button.dart';
import '../../../../../core/models/model_user.dart';
import '../../../../../core/utils/utilities_general.dart';
import '../../../data/models/model_story.dart';

class ShareStoryView extends StatelessWidget {
  final Uint8List storyImage;
  ShareStoryView({@required this.storyImage});
  @override
  Widget build(BuildContext context) {
    return BaseView(
      model: BaseViewModel(),
      builder: (_, BaseViewModel vm, __) {
        return Scaffold(
          backgroundColor: Colors.black54,
          appBar: AppBar(title: Text('Story')),
          body: ListView(
            children: [
              SizedBox(height: 30),
              Text('Check before sharing your story!', textAlign: TextAlign.center, style: TextStyle(color: Colors.white)),
              Padding(padding: EdgeInsets.symmetric(vertical: 30.0), child: Image.memory(storyImage)),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.0),
                child: AsyncButton(
                  label: LocalizationService.texts.shareButtonText,
                  onPressed: () async {
                    UserModel user = Provider.of<UserProvider>(context, listen: false).currentUser;
                    Provider.of<FeedProvider>(context, listen: false).addStory(
                      StoryModel(
                        publisherName: user.name,
                        shareTime: GeneralUtils.getReadableDate(timeStamp: DateTime.now().toString()),
                        image: storyImage,
                        thumbNailImage: user.avatar,
                      ),
                    );
                    vm.navigateTo('/view_bottom_navigation');
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
