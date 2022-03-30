// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
//
// import '../../../core/UI/widgets/async_button.dart';
// import '../../../utils/utilities_arguments.dart';
// import '../../../utils/utilities_general.dart';
//
// class ChallengeDetailScreen extends StatefulWidget {
//   @override
//   State<ChallengeDetailScreen> createState() => _ChallengeDetailScreenState();
// }
//
// class _ChallengeDetailScreenState extends State<ChallengeDetailScreen> {
//   @override
//   Widget build(BuildContext context) {
//     ChallengeDetailScreenArgs args = ModalRoute.of(context).settings.arguments as ChallengeDetailScreenArgs;
//     return Scaffold(
//       appBar: AppBar(title: Text(args.challengeData.challengeTitle.toString())),
//       body: ListView(
//         physics: BouncingScrollPhysics(),
//         padding: EdgeInsets.symmetric(horizontal: 12.0),
//         children: [
//           SizedBox(height: 12),
//           ClipRRect(borderRadius: BorderRadius.circular(20.0), child: Image.asset(args.challengeData.challengeImage)),
//           Padding(
//             padding: EdgeInsets.symmetric(vertical: 20),
//             child: Text(args.challengeData.challengeInfo, textAlign: TextAlign.center),
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               AsyncButton(
//                 useElevatedButton: true,
//                 useIconElevatedButton: true,
//                 iconWidget: Icon(Icons.add_a_photo_rounded),
//                 onPressed: () async {
//                   var imageData = await GeneralUtils.pickImage(src: ImageSource.camera);
//                   await Navigator.pushNamed(context, '/screen_share_challenge',
//                       arguments:
//                           ChallengeShareDetailScreenArgs(imageData: imageData.readAsBytesSync(), challengeData: args.challengeData));
//                 },
//                 label: 'Fotoğraf Çek',
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
