import 'package:lottie/lottie.dart';
import 'package:screenshot/screenshot.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import '../../../../core/UI/presentation/view_base.dart';
import '../../../../core/UI/shared/assets.dart';
import '../../../../core/UI/shared/colors.dart';
import '../../../../core/UI/shared/lists.dart';
import '../../../../core/UI/shared/styles.dart';
import '../../../../core/UI/widgets/or_divider.dart';
import '../../../../core/UI/widgets/over_scroll.dart';
import '../../../../core/UI/widgets/overflow_handler.dart';
import '../../../../core/UI/widgets/widget_avatar_back_ground.dart';
import '../../../../core/services/service_localization.dart';
import '../../../../core/models/model_user.dart';
import '../../../../providers/provider_user.dart';
import '../view_models/view_model_profile.dart';

class ProfileView extends StatefulWidget {
  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  ScreenshotController _ssController = ScreenshotController();
  UserModel _currentUser = UserModel();

  @override
  Widget build(BuildContext context) {
    _currentUser = Provider.of<UserProvider>(context, listen: true).currentUser;
    return BaseView(
      model: ProfileViewModel(),
      builder: (_, ProfileViewModel vm, __) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: _getAppBar(vm),
          body: OverScroll(
            child: ListView(
              children: [
                AvatarBackgroundWidget(image: _currentUser.avatar, userData: _currentUser),
                _getDetailWidgets(),
                Center(
                  child: ElevatedButton.icon(
                    icon: Icon(Icons.share_rounded),
                    label: Text(LocalizationService.texts.shareButtonText),
                    onPressed: () async => vm.shareScreenshot(_ssController),
                  ),
                ),
                SizedBox(height: 20),
                Text('Stats For The Enthusiast', style: UIStyles.titleStyle, textAlign: TextAlign.center),
                Lottie.asset(UIAssets.chartsGif, height: 100),
                Center(
                  child: ElevatedButton.icon(
                    icon: Icon(Icons.bar_chart),
                    label: Text('Let me see!'),
                    onPressed: () async => vm.navigateTo('/view_statistics'),
                  ),
                ),
                SizedBox(height: 30),
                OrDivider(text: LocalizationService.texts.drawerItemBadges, spaceAround: 5),
                _getFooter(vm),
              ],
            ),
          ),
        );
      },
    );
  }

  AppBar _getAppBar(ProfileViewModel vm) => AppBar(
        elevation: 1,
        foregroundColor: UIColors.primaryColor,
        backgroundColor: UIColors.tertiaryColor,
        title: OverFlowHandler(child: Text(_currentUser.name.toString(), style: TextStyle(color: UIColors.primaryColor))),
        actions: [
          IconButton(icon: Icon(Icons.search), onPressed: () => vm.navigateTo('/view_search')),
          IconButton(icon: Icon(Icons.settings), onPressed: () => vm.navigateTo('/view_settings')),
        ],
      );

  Screenshot _getDetailWidgets() => Screenshot(
        controller: _ssController,
        child: Container(
          color: Colors.white,
          margin: EdgeInsets.symmetric(vertical: 5.0),
          padding: EdgeInsets.symmetric(vertical: 20.0),
          child: GridView(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
            children: [
              _getDetailWidget(
                  "${_currentUser.recycled ?? 0} g", LocalizationService.texts.friendProfileRecycled, UIAssets.recycleSignIcon),
              _getDetailWidget(
                  "${_currentUser.calculateImpact() ?? 0} Wh", LocalizationService.texts.impacted, UIAssets.renewableEnergyIcon),
              _getDetailWidget(
                  "${_currentUser.calculateFootPrint() ?? 0}", LocalizationService.texts.carbonFootprint, UIAssets.leafIcon),
            ],
          ),
        ),
      );

  Column _getDetailWidget(String value, String text, String asset) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(asset, width: 60, fit: BoxFit.cover),
          SizedBox(height: 10),
          OverFlowHandler(child: Text(value.toString(), style: UIStyles.titleStyle)),
          FittedBox(fit: BoxFit.cover, child: Padding(padding: EdgeInsets.all(8.0), child: Text(text))),
        ],
      );

  GestureDetector _getFooter(ProfileViewModel vm) => GestureDetector(
        onTap: () => vm.navigateTo('/view_badges'),
        child: SizedBox(
          height: 120,
          child: OverFlowHandler(
            child: Row(
              children: <Widget>[
                Image.asset(UILists.badges[0].activeImage),
                Image.asset(UILists.badges[2].activeImage),
                Image.asset(UILists.badges[3].activeImage),
                Image.asset(UILists.badges[4].activeImage),
                Image.asset(UILists.badges[5].activeImage),
              ],
            ),
          ),
        ),
      );
}
