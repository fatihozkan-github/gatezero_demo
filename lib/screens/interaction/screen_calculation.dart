import 'package:gatezero_demo/providers/provider_interaction.dart';
import 'package:lottie/lottie.dart';
import 'package:screenshot/screenshot.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import '../../UI/design_materials/DM_assets.dart';
import '../../UI/design_materials/DM_colors.dart';
import '../../UI/design_materials/DM_styles.dart';
import '../../UI/design_materials/DM_lists.dart';
import '../../UI/components/async_button.dart';
import '../../UI/components/or_divider.dart';
import '../../UI/components/we_avatar.dart';
import '../../providers/provider_user.dart';
import '../../utils/utilities_general.dart';
import '../../UI/components/we_spin.dart';

class CalculationScreen extends StatefulWidget {
  @override
  State<CalculationScreen> createState() => _CalculationScreenState();
}

class _CalculationScreenState extends State<CalculationScreen> with SingleTickerProviderStateMixin {
  ScreenshotController _ssController = ScreenshotController();
  num _recycled = 0;
  num _expGained = 0;
  num _coinGained = 0;
  int _feedbackIndex = 0;
  bool _isCompleted = false;

  calculate() {
    num recycledAmount = Provider.of<InteractionProvider>(context, listen: false).getRewards();
    _expGained = (recycledAmount * 1.2).toInt();
    _coinGained = (recycledAmount * 1.2).toInt();
    Provider.of<UserProvider>(context, listen: false).currentUser.coins += _coinGained.toInt();
    Provider.of<UserProvider>(context, listen: false).currentUser.exp += _expGained.toInt();
    setState(() {});
    Provider.of<InteractionProvider>(context, listen: false).clearList();
  }

  void _listenAmount() async {
    await Future.delayed(Duration(seconds: 2), () => setState(() => _feedbackIndex++));
    await Future.delayed(Duration(seconds: 2), () => setState(() => _feedbackIndex++));
    calculate();
    await Future.delayed(Duration(seconds: 2), () => setState(() => _isCompleted = true));
  }

  AnimationController _controller;
  @override
  void initState() {
    _listenAmount();
    _controller = AnimationController(vsync: this);
    _controller.value = 0.5;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_isCompleted ? 'Ödülünü Al' : 'Hesaplanıyor..')),
      body: _isCompleted ? _getCompletedBody() : _getWaitingBody(),
    );
  }

  _getCompletedBody() {
    String _avatar = Provider.of<UserProvider>(context).currentUser.avatar;
    return ListView(
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 12.0),
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 30.0),
          child: Screenshot(
            controller: _ssController,
            child: Container(
              color: Colors.white,
              margin: EdgeInsets.symmetric(vertical: 30),
              child: Column(
                children: [
                  SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                            color: GeneralUtils.hasData(_avatar) ? Colors.orange : Colors.greenAccent,
                            spreadRadius: 4,
                            blurRadius: 10),
                        BoxShadow(
                            color: GeneralUtils.hasData(_avatar) ? UIColors.primaryColor : Colors.green,
                            spreadRadius: -6,
                            blurRadius: 3)
                      ],
                    ),
                    child: WEAvatar(
                      size: 170,
                      image: _avatar,
                      fallBackImage: Image.asset(UIAssets.approvedIcon, width: 170, height: 170, fit: BoxFit.cover),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.0),
                    child:
                        Text('Tebrikler!', textAlign: TextAlign.center, style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
                  ),
                  _getDetailWidgets(),
                ],
              ),
            ),
          ),
        ),
        AsyncButton(label: 'PAYLAŞ!', onPressed: () async => await GeneralUtils.takeSSandShare(_ssController)),
        OrDivider(text: 'ya da', spaceAround: 15),
        Center(
          child: ElevatedButton(
            child: Text('Ana sayfaya dön'),
            onPressed: () => Navigator.pushReplacementNamed(context, '/bottom_navigation'),
          ),
        ),
      ],
    );
  }

  _getWaitingBody() => Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Lottie.asset(
            UIAssets.ecologyGif,
            width: 300,
            repeat: true,
            controller: _controller,
            onLoaded: (comp) {
              _controller
                ..duration = comp.duration
                ..forward();
            },
          ),
          Text(UILists.afterUsageFeedbackList[_feedbackIndex], style: UIStyles.infoStyle, textAlign: TextAlign.center),
          WESpinKit(),
        ],
      );

  Row _getDetailWidgets() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _getDetailWidget("$_coinGained", "Z-score Kazanıldı", UIAssets.coinIcon),
          _getDetailWidget("$_recycled g", "Dönüştürüldü", UIAssets.recycleSignIcon),
          _getDetailWidget("$_expGained Wh", "Etki Edildi", UIAssets.renewableEnergyIcon),
        ],
      );

  _getDetailWidget(String value, String text, String asset) => Expanded(
        child: Column(
          children: [
            Image.asset(asset, width: 65),
            SizedBox(height: 10),
            Text(value.toString(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            FittedBox(fit: BoxFit.cover, child: Padding(padding: EdgeInsets.all(8.0), child: Text(text))),
          ],
        ),
      );
}
