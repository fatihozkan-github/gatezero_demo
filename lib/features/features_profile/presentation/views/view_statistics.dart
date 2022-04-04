import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/UI/presentation/view_base.dart';
import '../../../../core/UI/presentation/view_model_base.dart';
import '../../../../core/UI/shared/assets.dart';
import '../../../../core/UI/widgets/over_scroll.dart';
import '../../../../core/utils/utilities_enums.dart';

class StatisticsView extends StatefulWidget {
  @override
  State<StatisticsView> createState() => _StatisticsViewState();
}

mixin ScrollHandlerMixin {
  scrollTo(ScrollController controller, double offset) {
    if (controller.hasClients) {
      controller.animateTo(offset, duration: Duration(milliseconds: 500), curve: Curves.fastOutSlowIn);
    }
  }

  printPosition(ScrollController controller) {
    if (controller.hasClients) {
      print(controller.position);
    }
  }

  atMaximumExtend(ScrollController controller) {
    if (controller.hasClients) {
      if (controller.position.atEdge && controller.position.pixels != 0) {
        return true;
      } else
        return false;
    } else
      return false;
  }
}

class _StatisticsViewState extends State<StatisticsView> with SingleTickerProviderStateMixin, ScrollHandlerMixin {
  ScrollController _controller = ScrollController();
  bool _atMax = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(Duration(milliseconds: 500), () {
        if (_controller.hasClients) {
          _controller.addListener(() {
            _atMax = atMaximumExtend(_controller);
            if (_atMax) setState(() {});
          });
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BaseView(
      model: BaseViewModel(),
      builder: (_, BaseViewModel vm, __) {
        return Scaffold(
          extendBodyBehindAppBar: true,
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: Text("Statistics", style: TextStyle(color: Color(0xFF23CDCC), fontSize: 26, fontWeight: FontWeight.bold)),
            elevation: 0,
            centerTitle: false,
            backgroundColor: Colors.transparent,
            foregroundColor: Color(0xFF23CDCC),
          ),
          body: Stack(
            children: [
              Container(
                width: size.width,
                height: size.height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DelayedDisplay(
                      slidingBeginOffset: const Offset(0.25, -0.25),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Lottie.asset(UIAssets.backgroundWave1Gif, width: size.width / 1.5),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        DelayedDisplay(
                          slidingBeginOffset: const Offset(-0.25, 0.25),
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Lottie.asset(UIAssets.backgroundWave2Gif, width: size.width / 1.5)),
                        ),
                        if (!_atMax)
                          DelayedDisplay(
                            delay: Duration(milliseconds: 1500),
                            slidingBeginOffset: const Offset(0.25, 0.25),
                            child: Lottie.asset(UIAssets.swipeGif, width: 120),
                          )
                      ],
                    ),
                  ],
                ),
              ),
              OverScroll(
                child: ListView(
                  controller: _controller,
                  physics: const PageScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  children: [
                    DelayedDisplay(
                      delay: Duration(milliseconds: 1200),
                      slidingBeginOffset: const Offset(0.0, 0.05),
                      child: _getContainer(
                        size,
                        UIAssets.presentationGif,
                        "People often think recycling is cumbersome. Well, we would like to summarize that this is not actually the case :)",
                      ),
                    ),
                    _getContainer(
                      size,
                      UIAssets.bottlesGif,
                      "When you recycle 153 grams of plastic, you will save the world from the energy consumed by an A+ refrigerator per day.",
                      repeat: false,
                    ),
                    _getContainer(
                      size,
                      UIAssets.houseGif,
                      "4 kg of recycled plastic is equivalent to the daily energy consumption of a nuclear family.",
                      repeat: false,
                    ),
                    _getContainer(
                      size,
                      UIAssets.ecologyGif,
                      "When you recycle 250 grams, you save the world from the amount of CO2 that 15 trees absorb annually!",
                    ),
                    _getContainer(
                      size,
                      UIAssets.rotatingLeavesGif,
                      "We tried to briefly explain how important recycling is. You can follow our social media channels for more detailed information!\n\nUntil then, don't forget to recycle :)",
                    ),
                  ],
                ),
              ),
              if (_atMax)
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: ElevatedButton(
                      onPressed: () => vm.navigateTo('/', action: RouterAction.pop),
                      child: Text("Return", style: TextStyle(fontWeight: FontWeight.bold)),
                      style: ElevatedButton.styleFrom(primary: Color(0xFF23CDCC)),
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }

  Container _getContainer(Size size, String lottie, String text, {bool repeat = true}) {
    return Container(
      width: size.width,
      height: size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(lottie, width: size.width / 1.5, repeat: repeat),
          SizedBox(height: 50),
          Text(text, textAlign: TextAlign.center, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
