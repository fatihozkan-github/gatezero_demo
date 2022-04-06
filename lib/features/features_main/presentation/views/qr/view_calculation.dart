import 'package:screenshot/screenshot.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'dart:async';

import '../../../../../core/UI/presentation/view_base.dart';
import '../../../../../core/UI/shared/assets.dart';
import '../../../../../core/UI/shared/lists.dart';
import '../../../../../core/UI/shared/styles.dart';
import '../../../../../core/UI/widgets/async_button.dart';
import '../../../../../core/UI/widgets/gatezero_avatar.dart';
import '../../../../../core/UI/widgets/or_divider.dart';
import '../../../../../core/UI/widgets/widget_loading.dart';
import '../../../../../core/services/service_localization.dart';
import '../../../../../providers/provider_interaction.dart';
import '../../../../../providers/provider_user.dart';
import '../../view_models/qr/view_model_calculation.dart';

class CalculationView extends StatefulWidget {
  @override
  State<CalculationView> createState() => _CalculationViewState();
}

class _CalculationViewState extends State<CalculationView> with SingleTickerProviderStateMixin {
  ScreenshotController _ssController = ScreenshotController();
  num _recycled = 0;
  num _expGained = 0;
  num _coinGained = 0;
  int _feedbackIndex = 0;
  bool _isCompleted = false;

  Future calculate() async {
    num recycledAmount = await Provider.of<InteractionProvider>(context, listen: false).getRewards();
    if (Provider.of<InteractionProvider>(context, listen: false).recycleList.isEmpty) {
      recycledAmount = await Provider.of<InteractionProvider>(context, listen: false).getRewards(barcodeRead: false);
    }
    _expGained = (recycledAmount * 1.3).toInt();
    _coinGained = (recycledAmount * 1.6).toInt();
    _recycled = (recycledAmount * 0.5).toInt();
    Provider.of<UserProvider>(context, listen: false).currentUser.coins += _coinGained.toInt();
    Provider.of<UserProvider>(context, listen: false).currentUser.exp += _expGained.toInt();
    Provider.of<UserProvider>(context, listen: false).currentUser.recycled += _recycled.toInt();
    setState(() {});
    Provider.of<InteractionProvider>(context, listen: false).clearList();
  }

  void _listenAmount() async {
    await Future.delayed(Duration(seconds: 2), () => setState(() => _feedbackIndex++));
    await Future.delayed(Duration(seconds: 2), () => setState(() => _feedbackIndex++));
    await calculate();
    await Future.delayed(Duration(seconds: 3), () => setState(() => _isCompleted = true));
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
    return BaseView(
      model: CalculationViewModel(),
      builder: (_, CalculationViewModel vm, __) => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(title: Text(_isCompleted ? 'Get Your Prize' : 'Calculating..')),
        body: _isCompleted ? _getCompletedBody(vm) : _getWaitingBody(),
      ),
    );
  }

  _getCompletedBody(CalculationViewModel vm) {
    String _avatar = Provider.of<UserProvider>(context).currentUser.avatar;
    return ListView(
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 12.0),
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0),
          child: Screenshot(
            controller: _ssController,
            child: Container(
              color: Colors.white,
              margin: EdgeInsets.symmetric(vertical: 20),
              child: Column(
                children: [
                  SizedBox(height: 20),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    child: Text('Congratulations!',
                        textAlign: TextAlign.center, style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Lottie.asset(UIAssets.prizeEffect2Gif),
                      GateZeroAvatar(
                        size: 170,
                        image: _avatar,
                        fallBackImage: Image.asset(UIAssets.approvedIcon, width: 170, height: 170, fit: BoxFit.cover),
                      ),
                    ],
                  ),
                  _getDetailWidgets(),
                  // Lottie.asset(UIAssets.tree1Gif),
                ],
              ),
            ),
          ),
        ),
        AsyncButton(label: LocalizationService.texts.shareButtonText, onPressed: () async => await vm.shareScreenshot(_ssController)),
        SizedBox(height: 10),
        OrDivider(text: 'OR', spaceAround: 15),
        Center(child: ElevatedButton(child: Text('Return to Home Page'), onPressed: () => vm.navigateTo('/view_profile'))),
      ],
    );
  }

  // Lottie.asset(UIAssets.chartsGif),

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
          LoadingWidget(),
        ],
      );

  Row _getDetailWidgets() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _getDetailWidget("$_coinGained", "GCoin", UIAssets.coinIcon),
          _getDetailWidget("yearly", "like a tree", UIAssets.co2Icon, bold: false),
          _getDetailWidget("$_expGained Wh", LocalizationService.texts.impacted, UIAssets.renewableEnergyIcon),
        ],
      );

  _getDetailWidget(String value, String text, String asset, {bool bold = true}) => Expanded(
        child: Column(
          children: [
            Image.asset(asset, width: 65, height: 65, fit: BoxFit.cover),
            SizedBox(height: 10),
            Text(value.toString(), style: TextStyle(fontWeight: bold ? FontWeight.bold : FontWeight.normal, fontSize: 18)),
            FittedBox(
                fit: BoxFit.cover, child: Padding(padding: EdgeInsets.all(8.0), child: Text(text, style: TextStyle(fontSize: 18)))),
          ],
        ),
      );
}
