// import 'package:flutter/material.dart';
// import 'package:gatezero_demo/screens/drawer/duels/tabs/tab_active_duels.dart';
// import 'package:gatezero_demo/screens/drawer/duels/tabs/tab_pending_duels.dart';
//
// import '../../../UI/design_materials/DM_colors.dart';
// import '../../../UI/design_materials/DM_styles.dart';
// import '../../../services/service_localization.dart';
//
// class DuelScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text(LocalizationService.texts.drawerItemChallenges)),
//       body: DefaultTabController(
//         length: 2,
//         child: Column(
//           children: [
//             Container(
//               height: 50,
//               color: Colors.white,
//               child: TabBar(
//                 labelColor: UIColors.primaryColor,
//                 unselectedLabelColor: Colors.black,
//                 indicatorColor: UIColors.primaryColor,
//                 tabs: [
//                   Tab(child: Text('Davetlerim', style: UIStyles.tabTitleStyle)),
//                   Tab(child: Text('Aktif Düellolarım', style: UIStyles.tabTitleStyle)),
//                 ],
//               ),
//             ),
//             Expanded(child: TabBarView(physics: BouncingScrollPhysics(), children: [PendingDuelsTab(), ActiveDuelsTab()]))
//           ],
//         ),
//       ),
//     );
//   }
// }
