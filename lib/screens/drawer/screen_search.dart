import 'package:gatezero_demo/UI/design_materials/mock_lists.dart';
import 'package:flutter/material.dart';

import '../../UI/components/rounded_list_tile.dart';
import '../../UI/components/rounded_text_field.dart';
import '../../UI/components/we_spin.dart';
import '../../UI/design_materials/DM_assets.dart';
import '../../models/model_friend.dart';
import '../../services/service_localization.dart';
import '../../utils/utilities_arguments.dart';
import '../../utils/utilities_general.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
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
                ? WESpinKit()
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
                                    ? NetworkImage(_userList[index].avatar)
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
