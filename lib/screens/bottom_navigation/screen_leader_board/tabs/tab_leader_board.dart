// import 'package:flutter/material.dart';
//
// import '../../../../core/UI/widgets/rounded_list_tile.dart';
// import '../../../../core/UI/shared/mock_lists.dart';
// import '../../../../UI/design_materials/DM_assets.dart';
// import '../../../../UI/design_materials/DM_lists.dart';
// import '../../../../core/UI/widgets/pull_refresher.dart';
// import '../../../../utils/utilities_arguments.dart';
// import '../../../../UI/components/we_avatar.dart';
// import '../../../../models/model_friend.dart';
//
// class LeaderBoardTab extends StatefulWidget {
//   @override
//   State<LeaderBoardTab> createState() => _LeaderBoardTabState();
// }
//
// class _LeaderBoardTabState extends State<LeaderBoardTab> {
//   List<FriendModel> _people = Mocks.mockUserList;
//
//   /// • Add certain valued posts to [_posts]
//   _onRefresh({refreshRequest = true}) async {
//     await Future.delayed(Duration(milliseconds: 1000));
//     if (mounted) setState(() {});
//   }
//
//   /// • Add more post to [_posts]
//   _onLoading() async {
//     await Future.delayed(Duration(milliseconds: 2000));
//     if (mounted) setState(() {});
//   }
//
//   @override
//   void initState() {
//     _onRefresh(refreshRequest: false);
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) =>
//       Scaffold(body: PullRefresher(child: _getBody(), refreshFunction: _onRefresh, loadingFunction: _onLoading));
//
//   _getBody() => ListView.builder(
//       itemCount: _people.length,
//       physics: BouncingScrollPhysics(),
//       itemBuilder: (context, index) {
//         return RoundedListTile(
//           title: Text(_people[index].name.toString()),
//           leading: WEAvatar(image: _people[index].avatar, fallBackImage: Image.asset(UIAssets.leaderBoardUserIcon)),
//           trailing: Image(
//             image: AssetImage(index < 3 ? UILists.leaderBoardIcons[index] : UILists.leaderBoardIcons[3]),
//             height: 48,
//             width: 48,
//             fit: BoxFit.cover,
//           ),
//           onPressed: () =>
//               Navigator.pushNamed(context, '/screen_other_profile', arguments: OtherProfileScreenArgs(friendModel: _people[index])),
//         );
//       });
// }
