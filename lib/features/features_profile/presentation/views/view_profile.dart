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
import '../../../../core/UI/widgets/gatezero_avatar.dart';
import '../../../../core/services/service_localization.dart';
import '../../../../core/utils/utilities_general.dart';
import '../../../../models/model_user.dart';
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
                _getProfilePic(),
                SizedBox(height: 20),
                _getHeader(),
                Padding(padding: EdgeInsets.all(8.0), child: _getDetailWidgets()),
                Center(
                  child: ElevatedButton.icon(
                    icon: Icon(Icons.share_rounded),
                    label: Text('Paylaş!'),
                    onPressed: () async => vm.shareScreenshot(_ssController),
                  ),
                ),
                SizedBox(height: 10),
                OrDivider(text: LocalizationService.texts.drawerItemBadges),
                _getFooter(vm),
                Lottie.asset(UIAssets.chartsGif),
                Center(
                  child: ElevatedButton(child: Text("Meraklısına İstatistikler"), onPressed: () => vm.navigateTo('/view_statistics')),
                ),
                SizedBox(height: 20),
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

  Stack _getProfilePic() => Stack(
        alignment: Alignment.center,
        children: [
          Column(
            children: [
              SizedBox(height: 60),
              Container(
                height: 73.5,
                child: RotatedBox(quarterTurns: 2, child: Lottie.asset('assets/gifs/wave.json')),
                decoration: BoxDecoration(borderRadius: BorderRadius.vertical(bottom: Radius.circular(20.0))),
              ),
              Container(
                height: 80,
                decoration: BoxDecoration(
                  color: Color(0xFF2872DD),
                  borderRadius: BorderRadius.vertical(bottom: Radius.circular(20.0)),
                ),
              ),
            ],
          ),
          GateZeroAvatar(
            size: 170,
            polygonBorder: true,
            image: _currentUser.avatar,
            fallBackImage: Image.asset(UIAssets.leaderBoardUserIcon, width: 170, height: 170),
          ),
        ],
      );

  Row _getHeader() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(GeneralUtils.hasData(_currentUser.superHero) ? _currentUser.superHero + ' | ' : '', style: UIStyles.titleStyle),
          Text((_currentUser.level == 0) ? 'Level 1' : 'Level ' + _currentUser.level.toString(), style: UIStyles.titleStyle),
        ],
      );

  Column _getImpact() => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.eco_rounded, color: Colors.green, size: 60),
          SizedBox(height: 10),
          OverFlowHandler(child: Text(_currentUser.calculateFootPrint(), style: UIStyles.titleStyle)),
          FittedBox(fit: BoxFit.cover, child: Padding(padding: EdgeInsets.all(8.0), child: Text('Karbon ayak izi'))),
        ],
      );

  Screenshot _getDetailWidgets() => Screenshot(
        controller: _ssController,
        child: Container(
          color: Colors.white,
          child: GridView(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            children: [
              _getDetailWidget("${_currentUser.coins ?? 0}", "Z-score Kazanıldı", UIAssets.coinIcon),
              _getDetailWidget("${_currentUser.recycled ?? 0} g", "Dönüştürüldü", UIAssets.recycleSignIcon),
              _getDetailWidget("${_currentUser.calculateImpact() ?? 0} Wh", "Etki Edildi", UIAssets.renewableEnergyIcon),
              _getImpact(),
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
          child: ListView(
            itemExtent: 100,
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            children: <Widget>[
              Image.asset(UILists.badges[0].activeImage),
              Image.asset(UILists.badges[2].activeImage),
              Image.asset(UILists.badges[3].activeImage),
              Image.asset(UILists.badges[4].activeImage),
              Image.asset(UILists.badges[5].activeImage),
            ],
          ),
        ),
      );
}
