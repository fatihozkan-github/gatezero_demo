import 'package:flutter/material.dart';
import 'package:gatezero_demo/core/UI/presentation/view_base.dart';
import 'package:gatezero_demo/core/utils/utilities_enums.dart';
import 'package:provider/provider.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../../../core/UI/shared/assets.dart';
import '../../../../core/UI/shared/colors.dart';
import '../../../../core/UI/widgets/rounded_button.dart';
import '../../../../core/services/service_localization.dart';
import '../view_models/view_model_landing.dart';

class WelcomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView(
        model: context.watch<LandingViewModel>(),
        builder: (_, LandingViewModel _vm, __) {
          return Scaffold(
            body: ListView(
              children: <Widget>[
                SizedBox(height: 150),
                Text(LocalizationService.texts.welcomePageTitle)
                    .textStyle(TextStyle(fontWeight: FontWeight.bold, color: UIColors.primaryColor, fontSize: 32))
                    .textAlignment(TextAlign.center),
                Image.asset(UIAssets.generalLogo).padding(vertical: 50.0).width(200).height(200),
                RoundedButton(
                  text: 'HADİ BAŞLAYALIM!',
                  onPressed: () => _vm.navigateTo('/view_bottom_navigation', action: RouterAction.pushAndRemove),
                ),
                SizedBox(height: 10),
              ],
            ).paddingDirectional(horizontal: 12.0),
          );
        });
  }
}
