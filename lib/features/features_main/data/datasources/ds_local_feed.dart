import '../../../../core/UI/shared/mock_lists.dart';
import '../models/model_post.dart';
import '../models/model_story.dart';

abstract class FeedLocalDataSource {
  Future<List<PostModel>> getPosts();
  Future<List<StoryModel>> getStories();
}

class FeedLocalDataSourceImpl implements FeedLocalDataSource {
  @override
  Future<List<PostModel>> getPosts() async => await Mocks.mockPostList;

  @override
  Future<List<StoryModel>> getStories() async => await Mocks.mockStoryList;
}
