import '../../services/service_localization.dart';
import '../../UI/design_materials/DM_assets.dart';
import '../../UI/design_materials/DM_lists.dart';
import '../../UI/design_materials/DM_utils.dart';
import '../../UI/components/we_icon_button.dart';
import '../../UI/views/view_badge.dart';
import 'package:flutter/material.dart';

class BadgeScreen extends StatefulWidget {
  @override
  State<BadgeScreen> createState() => _BadgeScreenState();
}

class _BadgeScreenState extends State<BadgeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(LocalizationService.texts.drawerItemBadges)),
      body: _getBodyWithData(context),
    );
  }

  ListView _getBodyWithData(context) {
    return ListView(
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
            BadgeView(badgeModel: UILists.badges[0]),
            BadgeView(badgeModel: UILists.badges[2]),
            BadgeView(badgeModel: UILists.badges[3]),
            BadgeView(badgeModel: UILists.badges[4]),
            BadgeView(badgeModel: UILists.badges[5]),
            WEIconButton(
              title: '',
              icon: Image.asset(UIAssets.badgeQuestionImage),
              onPressed: () => UIUtils.showGenericPopUp(context, subTitle: LocalizationService.texts.badgeQuestion),
            ),
          ],
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
