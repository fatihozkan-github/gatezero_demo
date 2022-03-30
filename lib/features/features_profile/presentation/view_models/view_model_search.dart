import 'package:gatezero_demo/core/UI/presentation/view_model_base.dart';
import 'package:gatezero_demo/core/utils/utilities_enums.dart';

import '../../../../core/UI/shared/mock_lists.dart';
import '../../../../core/models/model_friend.dart';

class SearchViewModel extends BaseViewModel {
  List<FriendModel> _userList = Mocks.mockUserList;
  List<FriendModel> get userList => _userList;

  SearchViewModel() {
    activityState = ActivityState.isLoading;
    filterUserList('');
    activityState = ActivityState.isLoaded;
  }

  filterUserList(String query) {
    List<FriendModel> _returnList = [];
    _userList.forEach((element) {
      if (element.name.contains(query)) {
        _returnList.add(element);
      }
    });
    _userList = _returnList;
    if (query.toString().trim().isEmpty) {
      _userList = Mocks.mockUserList;
    }
    notifyListeners();
  }
}
