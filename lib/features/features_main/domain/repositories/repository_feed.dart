import '../../data/models/model_post.dart';
import '../../data/models/model_story.dart';

abstract class FeedRepository {
  Future<List<StoryModel>> getStories();
  Future<List<PostModel>> getPosts();
}
