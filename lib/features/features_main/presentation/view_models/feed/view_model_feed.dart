import '../../../../../core/UI/presentation/view_model_base.dart';
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
    activityState = ActivityState.isLoaded;
    notifyListeners();
  }
}

// /// TODO: change setup
class MockFeedService {
  static getStories() => Mocks.mockStoryList;
  static getPosts() => Mocks.mockPostList;
}
