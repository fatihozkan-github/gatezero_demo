// import 'package:gatezero_demo/models/model_post.dart';
// import 'package:provider/provider.dart';
// import 'package:flutter/material.dart';
//
// import '../../../UI/design_materials/DM_colors.dart';
// import '../../../core/UI/widgets/pull_refresher.dart';
// import '../../../core/UI/widgets/over_scroll.dart';
// import '../../../UI/components/story_view.dart';
// import '../../../providers/provider_feed.dart';
// import '../../../UI/views/view_post.dart';
// import '../../../models/model_story.dart';
//
// class FeedScreen extends StatefulWidget {
//   @override
//   State<FeedScreen> createState() => _FeedScreenState();
// }
//
// class _FeedScreenState extends State<FeedScreen> {
//   _onRefresh() async => await Future.delayed(Duration(milliseconds: 1000));
//
//   @override
//   Widget build(context) => PullRefresher(child: _getBody(), refreshFunction: _onRefresh);
//
//   Widget _getBody() => Column(
//         children: [
//           Padding(
//             padding: EdgeInsets.all(12.0),
//             child: Row(
//               children: [
//                 Column(
//                   children: [
//                     GestureDetector(
//                       onTap: () => Navigator.pushNamed(context, '/screen_story'),
//                       child: Icon(Icons.add_circle_rounded, size: 70, color: UIColors.primaryColor),
//                     ),
//                     Text('Hikaye ekle'),
//                   ],
//                 ),
//                 Expanded(
//                   child: Container(
//                     height: 90,
//                     child: ListView(
//                       physics: BouncingScrollPhysics(),
//                       scrollDirection: Axis.horizontal,
//                       children: [
//                         for (StoryModel x in Provider.of<FeedProvider>(context, listen: false).storyList) StoryContainer(storyData: x),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Expanded(
//             child: OverScroll(
//               child: ListView(
//                 children: [
//                   for (PostModel x in Provider.of<FeedProvider>(context, listen: true).postList) PostView(postModel: x),
//                   SizedBox(height: 20),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       );
// }
