import 'package:gatezero_demo/providers/provider_user.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../../UI/components/rounded_list_tile.dart';
import '../../../../services/service_localization.dart';
import '../../../../UI/design_materials/DM_assets.dart';
import '../../../../UI/design_materials/DM_lists.dart';
import '../../../../utils/utilities_arguments.dart';
import '../../../../UI/components/we_avatar.dart';

class FriendsTab extends StatefulWidget {
  @override
  State<FriendsTab> createState() => _FriendsTabState();
}

class _FriendsTabState extends State<FriendsTab> {
  @override
  Widget build(BuildContext context) {
    List _friendList = Provider.of<UserProvider>(context, listen: true).currentUser.friends;
    return Scaffold(body: _friendList.isEmpty ? _bodyWithOutFriends() : _bodyWithFriends(_friendList));
  }

  Widget _bodyWithFriends(friendsList) => ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: friendsList.length,
      itemBuilder: (context, index) {
        return Row(
          children: [
            Expanded(
              child: RoundedListTile(
                onPressed: () async {
                  Navigator.pushNamed(context, '/screen_other_profile',
                      arguments: OtherProfileScreenArgs(friendModel: friendsList[index]));
                },
                leading: WEAvatar(image: friendsList[index].avatar, fallBackImage: Image.asset(UIAssets.leaderBoardUserIcon)),
                title: Text(friendsList[index].name),
                trailing: Image(
                  image: AssetImage(index < 3 ? UILists.leaderBoardIcons[index] : UILists.leaderBoardIcons[3]),
                  height: 48,
                  width: 48,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        );
      });

  ListView _bodyWithOutFriends() => ListView(
        children: [
          Padding(padding: EdgeInsets.only(left: 32, top: 20, bottom: 30), child: Lottie.asset(UIAssets.addFriendGif, repeat: false)),
          Text(
            LocalizationService.texts.leaderBoardFriendsTabNoFriendText,
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
        ],
      );
}
