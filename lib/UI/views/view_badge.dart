import 'package:flutter/material.dart';
import '../../models/model_badge.dart';
import '../components/we_icon_button.dart';
import '../design_materials/DM_colors.dart';
import '../design_materials/DM_utils.dart';

class BadgeView extends StatelessWidget {
  final bool condition;
  final BadgeModel badgeModel;
  BadgeView({this.badgeModel, this.condition = true});

  @override
  Widget build(BuildContext context) {
    return WEIconButton(
      title: badgeModel.title ?? '',
      onPressed: () => UIUtils.showGenericPopUp(context, subTitle: badgeModel.detailText),
      icon: Image.asset(condition ? badgeModel.activeImage : badgeModel.inactiveImage),
      textStyle: TextStyle(
        color: condition ? UIColors.primaryColor : Colors.grey,
        fontWeight: condition ? FontWeight.bold : FontWeight.normal,
        fontSize: 20,
      ),
    );
  }
}
