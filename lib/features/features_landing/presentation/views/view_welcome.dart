import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../../../core/UI/presentation/view_base.dart';
import '../../../../core/UI/shared/assets.dart';
import '../../../../core/UI/shared/colors.dart';
import '../../../../core/UI/widgets/rounded_button.dart';
import '../../../../core/services/service_localization.dart';
import '../../../../core/utils/utilities_enums.dart';
import '../view_models/view_model_landing.dart';

class WelcomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView(
      model: LandingViewModel(),
      builder: (_, LandingViewModel _vm, __) {
        return Scaffold(
          body: ListView(
            children: <Widget>[
              SizedBox(height: 100),
              Text(LocalizationService.texts.welcomePageTitle)
                  .textStyle(TextStyle(fontWeight: FontWeight.bold, color: UIColors.primaryColor, fontSize: 32))
                  .textAlignment(TextAlign.center),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 50.0),
                child: Image.asset(UIAssets.generalLogo, width: double.infinity),
              ),
              RoundedButton(
                text: "LET'S START!",
                onPressed: () => _vm.navigateTo('/view_bottom_navigation', action: RouterAction.pushNamedAndRemove),
              ),
              SizedBox(height: 10),
            ],
          ).paddingDirectional(horizontal: 12.0),
        );
      },
    );
  }
}
