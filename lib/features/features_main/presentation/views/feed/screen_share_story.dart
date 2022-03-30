// import 'package:flutter/material.dart';
// import 'package:gatezero_demo/models/model_story.dart';
// import 'package:gatezero_demo/providers/provider_feed.dart';
// import 'package:gatezero_demo/providers/provider_user.dart';
// import 'package:gatezero_demo/utils/utilities_general.dart';
// import 'package:provider/provider.dart';
//
// import '../../../core/UI/widgets/async_button.dart';
// import '../../../utils/utilities_arguments.dart';
// import '../../../models/model_user.dart';
//
// class ShareStoryScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     ShareStoryScreenArgs args = ModalRoute.of(context).settings.arguments as ShareStoryScreenArgs;
//     return Scaffold(
//       backgroundColor: Colors.black54,
//       appBar: AppBar(title: Text('Hikaye')),
//       body: ListView(
//         children: [
//           SizedBox(height: 30),
//           Text('Hikayeni paylaşmadan önce kontrol et!', textAlign: TextAlign.center, style: TextStyle(color: Colors.white)),
//           Padding(padding: EdgeInsets.symmetric(vertical: 30.0), child: Image.memory(args.storyImage)),
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: 12.0),
//             child: AsyncButton(
//               label: 'PAYLAŞ!',
//               onPressed: () async {
//                 UserModel user = Provider.of<UserProvider>(context, listen: false).currentUser;
//                 Provider.of<FeedProvider>(context, listen: false).addStory(
//                   StoryModel(
//                     publisherName: user.name,
//                     shareTime: GeneralUtils.getReadableDate(timeStamp: DateTime.now().toString()),
//                     image: args.storyImage,
//                     thumbNailImage: user.avatar,
//                   ),
//                 );
//                 await Navigator.pushNamed(context, '/bottom_navigation');
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
