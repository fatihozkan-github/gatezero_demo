import '../../domain/repositories/repository_feed.dart';
import '../datasources/ds_local_feed.dart';
import '../models/model_post.dart';
import '../models/model_story.dart';

class FeedRepositoryImpl implements FeedRepository {
  final FeedLocalDataSourceImpl localDataSource;
  FeedRepositoryImpl({this.localDataSource});

  @override
  Future<List<PostModel>> getPosts() async {
    return await localDataSource.getPosts();
  }

  @override
  Future<List<StoryModel>> getStories() async {
    return await localDataSource.getStories();
  }
}
