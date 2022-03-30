import 'package:flutter/material.dart';

import '../../../../../core/UI/presentation/view_base.dart';
import '../../../../../core/UI/shared/colors.dart';
import '../../../../../core/UI/widgets/custom_scaffold.dart';
import '../../../../../core/UI/widgets/over_scroll.dart';
import '../../../../../core/UI/widgets/pull_refresher.dart';
import '../../../data/models/model_post.dart';
import '../../../data/models/model_story.dart';
import '../../view_models/feed/view_model_feed.dart';
import '../../widgets/widget_story.dart';
import '../../widgets/widget_post.dart';

class FeedView extends StatefulWidget {
  @override
  State<FeedView> createState() => _FeedViewState();
}

class _FeedViewState extends State<FeedView> {
  _onRefresh() async => await Future.delayed(Duration(milliseconds: 1000));

  @override
  Widget build(context) => PullRefresher(child: _getBody(), refreshFunction: _onRefresh);

  Widget _getBody() {
    return BaseView(
      model: FeedViewModel(),
      builder: (_, FeedViewModel vm, __) {
        return CustomScaffold(
          activityState: vm.activityState,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () => vm.navigateTo('/view_new_story'),
                          child: Icon(Icons.add_circle_rounded, size: 70, color: UIColors.primaryColor),
                        ),
                        Text('Hikaye ekle'),
                      ],
                    ),
                    Expanded(
                      child: Container(
                        height: 90,
                        child: ListView(
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          children: [for (StoryModel storyData in vm.storyList) StoryWidget(storyData: storyData)],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: OverScroll(
                  child: ListView(
                    children: [for (PostModel postData in vm.postList) PostWidget(postModel: postData), SizedBox(height: 20)],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
