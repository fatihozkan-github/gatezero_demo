import 'package:gatezero_demo/UI/components/over_scroll.dart';
import 'package:lottie/lottie.dart';
import 'package:screenshot/screenshot.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import '../../UI/components/or_divider.dart';
import '../../UI/components/overflow_handler.dart';
import '../../UI/components/we_avatar.dart';
import '../../UI/components/we_wave.dart';
import '../../UI/design_materials/DM_assets.dart';
import '../../UI/design_materials/DM_colors.dart';
import '../../UI/design_materials/DM_lists.dart';
import '../../UI/design_materials/DM_styles.dart';
import '../../models/model_user.dart';
import '../../providers/provider_user.dart';
import '../../services/service_localization.dart';
import '../../utils/utilities_general.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  ScreenshotController _ssController = ScreenshotController();
  UserModel _currentUser = UserModel();

  @override
  Widget build(BuildContext context) {
    _currentUser = Provider.of<UserProvider>(context, listen: true).currentUser;
    return Scaffold(
      backgroundColor: UIColors.tertiaryColor,
      appBar: _getAppBar(),
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
                onPressed: () async => await GeneralUtils.takeSSandShare(_ssController),
              ),
            ),
            SizedBox(height: 10),
            OrDivider(text: LocalizationService.texts.drawerItemBadges),
            _getFooter(),
            Lottie.asset(UIAssets.chartsGif),
            Center(
              child: ElevatedButton(
                child: Text("Meraklısına İstatistikler"),
                onPressed: () => Navigator.pushNamed(context, '/screen_statistics'),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  AppBar _getAppBar() => AppBar(
        elevation: 1,
        foregroundColor: UIColors.primaryColor,
        backgroundColor: UIColors.tertiaryColor,
        title: OverFlowHandler(child: Text(_currentUser.name.toString(), style: TextStyle(color: UIColors.primaryColor))),
        actions: [
          IconButton(icon: Icon(Icons.search), onPressed: () => Navigator.pushNamed(context, '/screen_search')),
          IconButton(icon: Icon(Icons.settings), onPressed: () => Navigator.pushNamed(context, '/screen_settings')),
        ],
      );

  Stack _getProfilePic() => Stack(
        alignment: Alignment.center,
        children: [
          ClipRRect(borderRadius: BorderRadius.vertical(bottom: Radius.circular(20.0)), child: WEWave(heightFactor: 0.5)),
          WEAvatar(
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

  GestureDetector _getFooter() => GestureDetector(
        onTap: () => Navigator.pushNamed(context, '/screen_badge'),
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
