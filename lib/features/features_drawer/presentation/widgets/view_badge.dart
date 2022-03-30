import 'package:flutter/material.dart';
import '../../../../core/UI/shared/colors.dart';
import '../../../../core/UI/shared/utils.dart';
import '../../../../models/model_badge.dart';
import '../../../../core/UI/widgets/we_icon_button.dart';

class BadgeWidget extends StatelessWidget {
  final bool condition;
  final BadgeModel badgeModel;
  BadgeWidget({this.badgeModel, this.condition = true});

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
