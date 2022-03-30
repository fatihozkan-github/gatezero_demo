import 'package:flutter/material.dart';

import '../../../../core/UI/presentation/view_base.dart';
import '../../../../core/UI/shared/assets.dart';
import '../../../../core/UI/shared/lists.dart';
import '../../../../core/UI/shared/utils.dart';
import '../../../../core/UI/widgets/we_icon_button.dart';
import '../../../../core/services/service_localization.dart';
import '../view_models/view_model_badges.dart';
import '../widgets/view_badge.dart';

class BadgesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView(
      model: BadgesViewModel(),
      builder: (_, vm, __) {
        return Scaffold(
          appBar: AppBar(title: Text(LocalizationService.texts.drawerItemBadges)),
          body: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              SizedBox(height: 20),
              Wrap(
                spacing: 10,
                runSpacing: 15,
                alignment: WrapAlignment.spaceEvenly,
                runAlignment: WrapAlignment.start,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: <Widget>[
                  BadgeWidget(badgeModel: UILists.badges[0]),
                  BadgeWidget(badgeModel: UILists.badges[2]),
                  BadgeWidget(badgeModel: UILists.badges[3]),
                  BadgeWidget(badgeModel: UILists.badges[4]),
                  BadgeWidget(badgeModel: UILists.badges[5]),
                  WEIconButton(
                    title: '',
                    icon: Image.asset(UIAssets.badgeQuestionImage),
                    onPressed: () => UIUtils.showGenericPopUp(context, subTitle: LocalizationService.texts.badgeQuestion),
                  ),
                ],
              ),
              SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }
}
