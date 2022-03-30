import 'package:gatezero_demo/core/UI/presentation/view_base.dart';
import 'package:gatezero_demo/providers/provider_user.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../../../../core/UI/shared/assets.dart';
import '../../../../../../core/UI/shared/lists.dart';
import '../../../../../../core/UI/widgets/rounded_list_tile.dart';
import '../../../../../../core/UI/widgets/gatezero_avatar.dart';
import '../../../../../../core/router/router.gr.dart';
import '../../../../../../core/services/service_localization.dart';
import '../../../view_models/leader_board/view_model_leader_board.dart';

class FriendsTab extends StatefulWidget {
  @override
  State<FriendsTab> createState() => _FriendsTabState();
}

class _FriendsTabState extends State<FriendsTab> {
  @override
  Widget build(BuildContext context) {
    List _friendList = Provider.of<UserProvider>(context, listen: true).currentUser.friends;
    return BaseView(
      model: LeaderBoardViewModel(),
      builder: (_, LeaderBoardViewModel vm, __) {
        return Scaffold(body: _friendList.isEmpty ? _bodyWithOutFriends() : _bodyWithFriends(_friendList, vm));
      },
    );
  }

  Widget _bodyWithFriends(friendsList, LeaderBoardViewModel vm) => ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: friendsList.length,
      itemBuilder: (context, index) {
        return Row(
          children: [
            Expanded(
              child: RoundedListTile(
                onPressed: () => vm.appRouter.push(OtherProfileViewRoute(friendModel: friendsList[index])),
                leading: GateZeroAvatar(image: friendsList[index].avatar, fallBackImage: Image.asset(UIAssets.leaderBoardUserIcon)),
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
