import 'package:flutter/material.dart';
import 'package:gatezero_demo/core/router/router.gr.dart';

import '../../../../../../core/UI/presentation/view_base.dart';
import '../../../../../../core/UI/shared/assets.dart';
import '../../../../../../core/UI/shared/lists.dart';
import '../../../../../../core/UI/widgets/pull_refresher.dart';
import '../../../../../../core/UI/widgets/rounded_list_tile.dart';
import '../../../../../../core/UI/widgets/gatezero_avatar.dart';
import '../../../view_models/leader_board/view_model_leader_board.dart';

class LeaderBoardTab extends StatefulWidget {
  @override
  State<LeaderBoardTab> createState() => _LeaderBoardTabState();
}

class _LeaderBoardTabState extends State<LeaderBoardTab> {
  @override
  Widget build(BuildContext context) => BaseView(
        model: LeaderBoardViewModel(),
        builder: (_, LeaderBoardViewModel vm, __) {
          return Scaffold(body: PullRefresher(child: _getBody(vm), refreshFunction: vm.onRefresh, loadingFunction: vm.onLoading));
        },
      );

  _getBody(LeaderBoardViewModel vm) => ListView.builder(
        itemCount: vm.peopleList.length,
        physics: BouncingScrollPhysics(),
        itemBuilder: (_, index) {
          return RoundedListTile(
            title: Text(vm.peopleList[index].name.toString()),
            leading: GateZeroAvatar(image: vm.peopleList[index].avatar, fallBackImage: Image.asset(UIAssets.leaderBoardUserIcon)),
            trailing: Image(
              image: AssetImage(index < 3 ? UILists.leaderBoardIcons[index] : UILists.leaderBoardIcons[3]),
              height: 48,
              width: 48,
              fit: BoxFit.cover,
            ),
            onPressed: () => vm.appRouter.push(OtherProfileViewRoute(friendModel: vm.peopleList[index])),
          );
        },
      );
}
