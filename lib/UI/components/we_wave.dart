import 'package:flutter/material.dart';
import 'package:gatezero_demo/UI/design_materials/DM_colors.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

class WEWave extends StatelessWidget {
  final List<double> heightPercentages;
  final List<List<Color>> gradients;
  final List<int> durations;
  final double heightFactor;
  final Size size;

  WEWave({this.size, this.durations, this.gradients, this.heightPercentages, this.heightFactor = 0.5});

  @override
  Widget build(BuildContext context) {
    return WaveWidget(
      waveAmplitude: 5,
      size: Size(double.infinity, 210),
      config: CustomConfig(
        gradientEnd: Alignment.topRight,
        gradientBegin: Alignment.bottomLeft,
        blur: MaskFilter.blur(BlurStyle.solid, 10),
        durations: [35000, 29440, 20800],
        gradients: UIColors.waveBlueColors,
        heightPercentages: [0.92 - heightFactor, 0.94 - heightFactor, 0.97 - heightFactor],
      ),
    );
  }
}
