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

  calculate() {
    num recycledAmount = Provider.of<InteractionProvider>(context, listen: false).getRewards();
    _expGained = (recycledAmount * 1.2).toInt();
    _coinGained = (recycledAmount * 1.2).toInt();
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
    calculate();
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
        appBar: AppBar(title: Text(_isCompleted ? 'Ödülünü Al' : 'Hesaplanıyor..')),
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
                    child:
                        Text('Tebrikler!', textAlign: TextAlign.center, style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
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
                ],
              ),
            ),
          ),
        ),
        AsyncButton(label: 'PAYLAŞ!', onPressed: () async => await vm.shareScreenshot(_ssController)),
        SizedBox(height: 10),
        // AsyncButton(label: "Meraklısına İstatistikler", onPressed: () async => await vm.navigateTo('/view_statistics')),
        OrDivider(text: 'ya da', spaceAround: 15),
        Center(child: ElevatedButton(child: Text('Ana Sayfaya Dön'), onPressed: () => vm.navigateTo('/view_bottom_navigation'))),
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

///
///   getRewards() => recycleList.length * 20;
///   viewmodel içinde unutma.
