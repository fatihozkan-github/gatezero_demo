// import 'package:gatezero_demo/UI/components/overflow_handler.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:qr_code_scanner/qr_code_scanner.dart';
// import 'package:provider/provider.dart';
// import 'package:flutter/material.dart';
// import 'package:badges/badges.dart';
// import 'dart:io';
//
// import '../../../providers/provider_interaction.dart';
// import '../../../UI/design_materials/DM_colors.dart';
// import '../../../core/services/service_permission.dart';
//
// class ReadQRScreen extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() => _ReadQRScreenState();
// }
//
// class _ReadQRScreenState extends State<ReadQRScreen> {
//   final GlobalKey qrKey = GlobalKey();
//   PermissionStatus permissionStatus;
//   QRViewController _QRController;
//
//   @override
//   void initState() {
//     WidgetsBinding.instance.addPostFrameCallback((_) async {
//       permissionStatus = await PermissionService.checkCameraPermission();
//       setState(() {});
//     });
//     super.initState();
//   }
//
//   @override
//   void reassemble() {
//     super.reassemble();
//     if (Platform.isAndroid) {
//       _QRController?.pauseCamera();
//     }
//     _QRController?.resumeCamera();
//   }
//
//   @override
//   void dispose() {
//     _QRController?.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(context) {
//     return SafeArea(
//       child: Scaffold(
//         appBar: _getAppBar(),
//         body: _buildQrView(),
//         extendBodyBehindAppBar: true,
//         resizeToAvoidBottomInset: true,
//         backgroundColor: Colors.transparent,
//       ),
//     );
//   }
//
//   AppBar _getAppBar() => AppBar(
//         elevation: 0,
//         shadowColor: Colors.transparent,
//         backgroundColor: Colors.transparent,
//         leading: BackButton(color: UIColors.primaryColor),
//         title: OverFlowHandler(child: Text('Ürünlerini Okut', style: TextStyle(color: UIColors.primaryColor))),
//         actions: [
//           IconButton(
//             onPressed: () {},
//             icon: Badge(
//               badgeColor: Colors.green,
//               badgeContent: Text(
//                 Provider.of<InteractionProvider>(context, listen: true).recycleList.length.toString(),
//                 style: TextStyle(color: Colors.white, fontSize: 10),
//               ),
//               child: Icon(Icons.recycling_rounded, color: UIColors.primaryColor),
//             ),
//           ),
//           SizedBox(width: 10),
//         ],
//       );
//
//   Widget _buildQrView() {
//     if (permissionStatus.isGranted) {
//       return _getQRBody();
//     } else
//       return _getFallbackBody();
//   }
//
//   Stack _getQRBody() {
//     double _cutOutWidth = (MediaQuery.of(context).size.width < 400 || MediaQuery.of(context).size.height < 400) ? 250.0 : 350.0;
//     return Stack(
//       alignment: Alignment.bottomCenter,
//       children: [
//         QRView(
//           key: qrKey,
//           onQRViewCreated: (controller) => _onQRViewCreated(controller),
//           overlay: QrScannerOverlayShape(
//             borderColor: UIColors.primaryColor,
//             borderRadius: 5,
//             borderLength: 25,
//             borderWidth: 5,
//             cutOutHeight: _cutOutWidth - 50,
//             cutOutWidth: _cutOutWidth,
//           ),
//         ),
//         Padding(
//           padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 20.0),
//           child: Row(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: <Widget>[
//               OutlinedButton(
//                 onPressed: () async => await _QRController?.toggleFlash()?.whenComplete(() => setState(() {})),
//                 child: FutureBuilder(
//                   future: _QRController?.getFlashStatus(),
//                   builder: (context, s) {
//                     if (s.hasData) {
//                       return Icon(!s.data ? Icons.lightbulb_outline : Icons.lightbulb, size: 30);
//                     } else
//                       return Icon(Icons.lightbulb_outline);
//                   },
//                 ),
//               ),
//               if (Provider.of<InteractionProvider>(context, listen: false).recycleList.isNotEmpty)
//                 OutlinedButton(
//                   child: Icon(Icons.chevron_right, size: 30),
//                   onPressed: () async {
//                     bool _isFlashOn = await _QRController?.getFlashStatus();
//                     if (_isFlashOn) await _QRController?.toggleFlash();
//                     Navigator.popAndPushNamed(context, '/screen_interaction');
//                   },
//                 ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
//
//   _onQRViewCreated(QRViewController controller) {
//     _QRController = controller;
//     controller.scannedDataStream.listen((Barcode scanData) async {
//       print(scanData.code);
//       if (!Provider.of<InteractionProvider>(context, listen: false).recycleList.contains(scanData.code))
//         Provider.of<InteractionProvider>(context, listen: false).addMaterial(scanData.code);
//     });
//   }
//
//   _getFallbackBody() => Column(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           Column(
//             children: [
//               Text('QR kod taraması için \nkamera izninize ihtiyacımız var.',
//                   textAlign: TextAlign.center, style: TextStyle(fontSize: 18, color: UIColors.primaryColor)),
//               SizedBox(height: 20),
//               ElevatedButton(
//                   onPressed: () async {
//                     permissionStatus = await PermissionService.checkCameraPermission();
//                     setState(() {});
//                   },
//                   child: Text('Kontrol Et')),
//             ],
//           ),
//         ],
//       );
// }
