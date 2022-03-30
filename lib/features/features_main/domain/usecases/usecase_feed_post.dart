import '../../../../core/usecases/usecase.dart';
import '../../data/models/model_post.dart';
import '../repositories/repository_feed.dart';

class FeedPostUseCase implements UseCase {
  final FeedRepository repository;
  FeedPostUseCase(this.repository);

  @override
  Future<List<PostModel>> call() async {
    return await repository.getPosts();
  }
}
