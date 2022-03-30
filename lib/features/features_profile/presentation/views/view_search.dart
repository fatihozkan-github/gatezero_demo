import 'package:gatezero_demo/core/UI/shared/mock_lists.dart';
import 'package:flutter/material.dart';

import '../../../../core/UI/shared/assets.dart';
import '../../../../core/UI/widgets/rounded_list_tile.dart';
import '../../../../core/UI/widgets/rounded_text_field.dart';
import '../../../../core/UI/widgets/widget_loading.dart';
import '../../../../core/services/service_localization.dart';
import '../../../../core/utils/utilities_arguments.dart';
import '../../../../core/utils/utilities_general.dart';
import '../../../../models/model_friend.dart';

class SearchView extends StatefulWidget {
  @override
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  List<FriendModel> _userList = Mocks.mockUserList;
  bool _isLoading = true;

  Future<void> getAllUsersData({String query = ''}) async {
    setState(() => _isLoading = true);
    if (mounted) setState(() => _isLoading = false);
  }

  @override
  void initState() {
    getAllUsersData(query: '');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(LocalizationService.texts.drawerItemSearch)),
      body: Column(
        children: <Widget>[
          SizedBox(height: 10),
          RoundedTextField(
            hintText: 'Ara',
            icon: Icons.search,
            onChanged: (value) => getAllUsersData(query: value),
            padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
            textCapitalization: TextCapitalization.words,
          ),
          Expanded(
            child: _isLoading
                ? LoadingWidget()
                : ListView.builder(
                    shrinkWrap: true,
                    itemCount: _userList.length,
                    physics: BouncingScrollPhysics(),
                    padding: EdgeInsets.symmetric(horizontal: 12.0),
                    itemBuilder: (context, index) {
                      if (_userList.isNotEmpty) {
                        return RoundedListTile(
                            title: Text(_userList[index].name),
                            leading: Container(
                              width: 48,
                              height: 48,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(shape: BoxShape.circle),
                              child: Image(
                                image: GeneralUtils.hasData(_userList[index].avatar)
                                    ? AssetImage(_userList[index].avatar)
                                    : AssetImage(UIAssets.leaderBoardUserIcon),
                                fit: BoxFit.cover,
                              ),
                            ),
                            onPressed: () => Navigator.pushNamed(context, '/screen_other_profile',
                                arguments: OtherProfileScreenArgs(friendModel: _userList[index])));
                      } else
                        return Center(child: Text(LocalizationService.texts.couldNotFindAResult, textAlign: TextAlign.center));
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
