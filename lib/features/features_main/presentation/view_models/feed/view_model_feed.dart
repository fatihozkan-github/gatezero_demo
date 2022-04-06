import 'package:flutter/services.dart';

import '../../../../../core/UI/presentation/view_model_base.dart';
import '../../../../../core/UI/shared/assets.dart';
import '../../../../../core/UI/shared/mock_lists.dart';
import '../../../../../core/utils/utilities_enums.dart';
import '../../../data/models/model_post.dart';
import '../../../data/models/model_story.dart';

class FeedViewModel extends BaseViewModel {
  List<PostModel> _postList = [];
  List<StoryModel> _storyList = [];

  get postList => _postList;
  get storyList => _storyList;

  FeedViewModel() {
    init();
  }

  Future<void> init() async {
    activityState = ActivityState.isLoading;
    _postList = MockFeedService.getPosts();
    _storyList = MockFeedService.getStories();
    _storyList.add(
      StoryModel(
        publisherID: "0",
        publisherName: "GateZero Team",
        shareTime: DateTime.now().toString(),
        thumbNailImage: UIAssets.generalLogo,
        image: (await rootBundle.load('assets/mocks/mock_story2.png')).buffer.asUint8List(),
      ),
    );
    activityState = ActivityState.isLoaded;
    notifyListeners();
  }
}

class MockFeedService {
  static getStories() => Mocks.mockStoryList;
  static getPosts() => Mocks.mockPostList;
}
