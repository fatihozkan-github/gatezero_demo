// import 'package:flutter/material.dart';
//
// class PrizeView extends StatelessWidget {
//   final PrizeModel prizeModel;
//   final UserModel userModel;
//
//   PrizeView({this.prizeModel, this.userModel});
//
//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     return Container(
//       width: size.width,
//       height: size.height * 0.3,
//       margin: EdgeInsets.all(8.0),
//       padding: EdgeInsets.symmetric(horizontal: 12.0),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.all(Radius.circular(10.0)),
//         boxShadow: [BoxShadow(color: Colors.grey, offset: Offset(1, 1), blurRadius: 2)],
//       ),
//       child: Column(
//         children: [
//           Expanded(
//             flex: 4,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Expanded(child: OverFlowHandler(child: Text(prizeModel.title, style: TextStyle(fontWeight: FontWeight.bold)))),
//                 SizedBox(width: 10),
//                 GestureDetector(
//                     onTap: () => UIUtils.showGenericPopUp(context, subTitle: prizeModel.subTitle), child: Icon(Icons.info_outline)),
//               ],
//             ),
//           ),
//           Expanded(
//             flex: 10,
//             child: Padding(
//               padding: EdgeInsets.symmetric(horizontal: 12.0),
//               child: Image.network(
//                 prizeModel.photo,
//                 errorBuilder: (context, url, error) => Icon(Icons.error),
//                 loadingBuilder: (context, url, progress) {
//                   if (progress == null) {
//                     return url;
//                   } else
//                     return WESpinKit();
//                 },
//               ),
//             ),
//           ),
//           Expanded(
//             flex: 5,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(prizeModel.cost.toString() + ' ' + 'WE Coin' ?? 'Hata', style: TextStyle(fontWeight: FontWeight.bold)),
//                 ElevatedButton(
//                   child: Text('Çekilişe Katıl'),
//                   onPressed: () async {
//                     if (userModel.coins >= prizeModel.cost) {
//                       await PrizeService.updateUserCoin(user: userModel, prize: prizeModel);
//                       await PrizeService.joinToDraw(prizeID: prizeModel.id, userID: userModel.uID);
//                     } else if (userModel.coins < prizeModel.cost) {
//                       UIUtils.showToast('Yeterli WE Coine sahip değilsin!');
//                     }
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
