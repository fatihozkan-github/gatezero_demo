import '../../../../../core/UI/presentation/view_model_base.dart';
import '../../../../../core/utils/utilities_enums.dart';
import '../../../data/datasources/ds_local_feed.dart';
import '../../../data/models/model_post.dart';
import '../../../data/models/model_story.dart';
import '../../../data/repositories/repository_feed_impl.dart';
import '../../../domain/usecases/usecase_feed_post.dart';
import '../../../domain/usecases/usecase_feed_story.dart';

class FeedViewModel extends BaseViewModel {
  FeedPostUseCase _postUseCase = FeedPostUseCase(FeedRepositoryImpl(localDataSource: FeedLocalDataSourceImpl()));
  FeedStoryUseCase _storyUseCase = FeedStoryUseCase(FeedRepositoryImpl(localDataSource: FeedLocalDataSourceImpl()));

  List<PostModel> _postList = [];
  List<StoryModel> _storyList = [];

  get postList => _postList;
  get storyList => _storyList;

  FeedViewModel() {
    init();
  }

  Future<void> init() async {
    activityState = ActivityState.isLoading;
    _postList = await _postUseCase.call();
    _storyList = await _storyUseCase.call();
    activityState = ActivityState.isLoaded;
    notifyListeners();
  }
}
