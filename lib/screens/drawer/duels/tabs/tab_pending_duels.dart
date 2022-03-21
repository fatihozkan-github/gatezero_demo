import 'package:flutter/material.dart';

import '../../../../UI/design_materials/mock_lists.dart';
import '../../../../UI/design_materials/DM_assets.dart';
import '../../../../UI/components/we_avatar.dart';

class PendingDuelsTab extends StatefulWidget {
  @override
  State<PendingDuelsTab> createState() => _PendingDuelsTabState();
}

class _PendingDuelsTabState extends State<PendingDuelsTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            Text('Gönderilen Düello Davetlerim', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Expanded(
              child: ListView(
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 12.0),
                children: [
                  SizedBox(height: 10),
                  Container(
                    height: 100,
                    margin: EdgeInsets.symmetric(vertical: 4.0),
                    decoration: BoxDecoration(color: Colors.orange.withOpacity(0.05), borderRadius: BorderRadius.circular(15.0)),
                    child: ListTile(
                      leading: WEAvatar(image: Mocks.avatarFatih, fallBackImage: Image.asset(UIAssets.leaderBoardUserIcon)),
                      title: Text('Fatih Özkan düelloya davet edildi!'),
                      subtitle: Text("Fatih Özkan düellonu kabul edince burada görebileceksin!",
                          maxLines: 3, overflow: TextOverflow.ellipsis),
                    ),
                  ),
                ],
              ),
            ),
            Text('Gelen Düello Davetlerim', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Expanded(
              child: ListView(
                physics: BouncingScrollPhysics(),
                children: [
                  SizedBox(height: 10),
                  Text(
                    "Henüz bir düello davetin yok. Biri seni davet edince burada görebileceksin!",
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

// class PendingChallenge extends StatefulWidget {
//   @override
//   State<PendingChallenge> createState() => _PendingChallengeState();
// }
//
// class _PendingChallengeState extends State<PendingChallenge> {
//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       leading: WEAvatar(image: Mocks.avatarFatih, fallBackImage: Image.asset(UIAssets.leaderBoardUserIcon)),
//       title: OverFlowHandler(child: Text('Fatih Özkan seni düelloya davet etti!')),
//       subtitle: OverFlowHandler(child: Text("Düello teklifini kabul edecek misin?")),
//       trailing: Container(
//         width: 90,
//         height: 30,
//         child: Row(
//           children: [
//             GestureDetector(
//               child: Icon(Icons.check_rounded, color: Colors.green, size: 35),
//               onTap: () async {
//                 UIUtils.showToast("Düello kabul edildi!", success: true);
//                 // context.findAncestorStateOfType<_PendingDuelsTabState>().setState(() {});
//               },
//             ),
//             SizedBox(width: 15),
//             GestureDetector(
//               child: Icon(Icons.close_rounded, color: Colors.red, size: 35),
//               onTap: () async {
//                 UIUtils.showToast("Düello reddedildi!");
//                 // context.findAncestorStateOfType<_PendingDuelsTabState>().setState(() {});
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
