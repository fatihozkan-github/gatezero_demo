import '../../../../../core/UI/presentation/view_model_base.dart';
import '../../../../../core/UI/shared/mock_lists.dart';
import '../../../../../models/model_friend.dart';

class LeaderBoardViewModel extends BaseViewModel {
  List<FriendModel> _people = Mocks.mockUserList;

  get peopleList => _people;

  /// • Add certain valued posts to [_posts]
  onRefresh({refreshRequest = true}) async => await Future.delayed(Duration(milliseconds: 1000));

  /// • Add more post to [_posts]
  onLoading() async => await Future.delayed(Duration(milliseconds: 2000));
}
