import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../UI/components/rounded_button.dart';
import '../../UI/design_materials/DM_colors.dart';

class InteractionScreen extends StatelessWidget {
  static const platform = const MethodChannel("test_activity");

  _getNewActivity() async {
    try {
      await platform.invokeMethod('startNewActivity');
    } on PlatformException catch (e) {
      print(e.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: _getAppBar(),
      body: ListView(
        children: [
          SizedBox(height: 20),
          Text("algılama burada olmalı"),
          MaterialButton(
            child: const Text('Open Screen'),
            elevation: 5.0,
            height: 48.0,
            minWidth: 250.0,
            color: Colors.blue,
            textColor: Colors.white,
            onPressed: () {
              _getNewActivity();
            },
          ),
          RoundedButton(
            showGradient: true,
            useCustomChild: true,
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            onPressed: () => Navigator.pushNamed(context, '/screen_read_qr'),
            customChild: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(Icons.qr_code_rounded, color: Colors.white, size: 30),
                SizedBox(width: 5),
                Text("ilerle", textAlign: TextAlign.center),
              ],
            ),
          ),
        ],
      ),
    );
  }

  AppBar _getAppBar() => AppBar(
        elevation: 0,
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        leading: BackButton(color: UIColors.primaryColor),
        title: Text('Kutuyu Tanıt!', style: TextStyle(color: UIColors.primaryColor)),
      );
}
