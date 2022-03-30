import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'dart:io';

import '../../../../../core/UI/presentation/view_base.dart';
import '../../../../../core/UI/shared/colors.dart';
import '../../../../../core/UI/widgets/overflow_handler.dart';
import '../../view_models/qr/view_model_read_qr.dart';

class ReadQRView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ReadQRViewState();
}

class _ReadQRViewState extends State<ReadQRView> {
  final GlobalKey qrKey = GlobalKey();
  QRViewController _QRController;

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      _QRController?.pauseCamera();
    }
    _QRController?.resumeCamera();
  }

  @override
  void dispose() {
    _QRController?.dispose();
    super.dispose();
  }

  @override
  Widget build(context) {
    return BaseView(
      model: ReadQRViewModel(),
      builder: (_, ReadQRViewModel vm, __) {
        return SafeArea(
          child: Scaffold(
            appBar: _getAppBar(vm),
            body: _buildQrView(vm),
            extendBodyBehindAppBar: true,
            resizeToAvoidBottomInset: true,
            backgroundColor: Colors.transparent,
          ),
        );
      },
    );
  }

  AppBar _getAppBar(ReadQRViewModel vm) => AppBar(
        elevation: 0,
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        leading: BackButton(color: UIColors.primaryColor),
        title: OverFlowHandler(child: Text('Ürünlerini Okut', style: TextStyle(color: UIColors.primaryColor))),
        actions: [
          IconButton(
            ///TODO
            onPressed: () => {},
            icon: Badge(
              badgeColor: Colors.green,
              badgeContent: Text(vm.productList.length.toString(), style: TextStyle(color: Colors.white, fontSize: 10)),
              child: Icon(Icons.recycling_rounded, color: UIColors.primaryColor),
            ),
          ),
          SizedBox(width: 10),
        ],
      );

  Widget _buildQrView(vm) {
    if (vm.permissionStatus) {
      return _getQRBody(vm);
    } else
      return _getFallbackBody(vm);
  }

  Stack _getQRBody(ReadQRViewModel vm) {
    double _cutOutWidth = (MediaQuery.of(context).size.width < 400 || MediaQuery.of(context).size.height < 400) ? 250.0 : 350.0;
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        QRView(
          key: qrKey,
          onQRViewCreated: (controller) {
            _QRController = controller;
            controller.scannedDataStream.listen((Barcode scanData) async {
              // print(scanData.code);
              if (!vm.productList.contains(scanData.code)) vm.addProduct(scanData.code);
            });
          },
          overlay: QrScannerOverlayShape(
            borderWidth: 5,
            borderRadius: 5,
            borderLength: 25,
            cutOutWidth: _cutOutWidth,
            cutOutHeight: _cutOutWidth - 50,
            borderColor: UIColors.primaryColor,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 20.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              OutlinedButton(
                onPressed: () async => await _QRController?.toggleFlash()?.whenComplete(() => setState(() {})),
                child: FutureBuilder(
                  future: _QRController?.getFlashStatus(),
                  builder: (context, s) {
                    if (s.hasData) {
                      return Icon(!s.data ? Icons.lightbulb_outline : Icons.lightbulb, size: 30);
                    } else
                      return Icon(Icons.lightbulb_outline);
                  },
                ),
              ),
              if (vm.productList.isNotEmpty)
                OutlinedButton(
                  child: Icon(Icons.chevron_right, size: 30),
                  onPressed: () async {
                    bool _isFlashOn = await _QRController?.getFlashStatus();
                    if (_isFlashOn) await _QRController?.toggleFlash();
                    vm.navigateTo('/view_custom_ar');
                  },
                ),
            ],
          ),
        ),
      ],
    );
  }

  _getFallbackBody(ReadQRViewModel vm) => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('QR kod taraması için \nkamera izninize ihtiyacımız var.',
              textAlign: TextAlign.center, style: TextStyle(fontSize: 18, color: UIColors.primaryColor)),
          SizedBox(height: 20),
          ElevatedButton(child: Text('Kontrol Et'), onPressed: () async => vm.checkPermission()),
        ],
      );
}
