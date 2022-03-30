import 'package:gatezero_demo/providers/provider_user.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import '../../../../core/UI/shared/assets.dart';
import '../../../../core/UI/shared/colors.dart';
import '../../../../core/UI/shared/styles.dart';
import '../../../../core/UI/shared/utils.dart';
import '../../../../core/UI/widgets/overflow_handler.dart';
import '../../../../core/utils/utilities_arguments.dart';
import '../../../../core/utils/utilities_general.dart';
import '../../../../models/model_user.dart';
import '../../../../core/UI/widgets/we_avatar.dart';
import '../../../../core/UI/widgets/we_wave.dart';

class OtherProfileView extends StatefulWidget {
  @override
  _OtherProfileViewState createState() => _OtherProfileViewState();
}

class _OtherProfileViewState extends State<OtherProfileView> {
  OtherProfileScreenArgs args = OtherProfileScreenArgs();

  @override
  void didChangeDependencies() async {
    args = ModalRoute.of(context).settings.arguments as OtherProfileScreenArgs;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UIColors.tertiaryColor,
      appBar: AppBar(title: OverFlowHandler(child: Text(args.friendModel.name.toString()))),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          _getProfilePic(args),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                GeneralUtils.hasData(args.friendModel.superhero) ? args.friendModel.superhero + ' | ' : '',
                style: UIStyles.titleStyle,
              ),
              Text(
                'Level ' + args.friendModel.level.toString() == 'Level 0' ? 'Level 1' : 'Level ' + args.friendModel.level.toString(),
                style: UIStyles.titleStyle,
              ),
            ],
          ),
          Padding(padding: EdgeInsets.all(8.0), child: _getDetailWidgets(args)),
          _getButtons(args),
        ],
      ),
    );
  }

  Stack _getProfilePic(OtherProfileScreenArgs args) => Stack(
        alignment: Alignment.center,
        children: [
          ClipRRect(borderRadius: BorderRadius.vertical(bottom: Radius.circular(20.0)), child: WEWave(heightFactor: 0.5)),
          WEAvatar(
            image: args.friendModel.avatar,
            size: 190,
            fallBackImage: Image.asset(UIAssets.leaderBoardUserIcon, width: 190, height: 190),
            polygonBorder: true,
          ),
        ],
      );

  _getButtons(args) {
    UserProvider userProvider = Provider.of<UserProvider>(context, listen: true);
    UserModel _currentUser = userProvider.currentUser;
    return (args.friendModel.id != _currentUser.uID)
        ? Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(),
              _currentUser.friends.contains(args.friendModel)
                  ? OutlinedButton.icon(
                      icon: Icon(Icons.check_rounded, color: UIColors.primaryColor),
                      label: Text("ARKADAŞSINIZ",
                          textAlign: TextAlign.center, style: TextStyle(color: UIColors.primaryColor, fontSize: 15)),
                      onPressed: () async {},
                    )
                  : OutlinedButton.icon(
                      icon: Icon(Icons.person_add_alt_1_rounded, color: UIColors.primaryColor),
                      label: Text("ARKADAŞ EKLE",
                          textAlign: TextAlign.center, style: TextStyle(color: UIColors.primaryColor, fontSize: 15)),
                      onPressed: () async {
                        userProvider.addFriend(args.friendModel);
                        print(userProvider.currentUser.friends);
                        setState(() {});
                      },
                    ),
              SizedBox(height: 30),
              _currentUser.friends.contains(args.friendModel)
                  ? Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        Text(
                          "Arkadaşını düelloya davet et!\nHem sen hem o ayrıcalıklardan yararlanın!",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 17),
                        ),
                        GestureDetector(
                          child: Lottie.asset(UIAssets.swordsGif, height: 200, fit: BoxFit.fitWidth),
                          onTap: () {
                            UIUtils.showToast("Düelloya davet edildi, bol şans!", shortDuration: false);
                          },
                        ),
                      ],
                    )
                  : SizedBox(),
            ],
          )
        : Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.0),
                child: Text(
                  'Kendini düelloya davet edemezsin :) Fakat tek rakibim benim diyorsan:',
                  textAlign: TextAlign.center,
                  style: UIStyles.infoStyle,
                ),
              ),
              SizedBox(height: 15),
              Center(
                child: ElevatedButton(
                  child: Text('Meydan Okumalar'),
                  onPressed: () => Navigator.pushNamed(context, '/screen_challenge'),
                ),
              ),
            ],
          );
  }

  _getDetailWidgets(OtherProfileScreenArgs args) => GridView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        children: [
          _getDetailWidget("${args.friendModel.coins ?? 0}", "WE Coin", UIAssets.coinIcon),
          _getDetailWidget("${args.friendModel.recycled ?? 0} g", "Dönüştürüldü", UIAssets.recycleSignIcon),
        ],
      );

  _getDetailWidget(String value, String text, String asset) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(asset, width: 60, fit: BoxFit.cover),
          SizedBox(height: 10),
          OverFlowHandler(child: Text(value.toString(), style: UIStyles.titleStyle)),
          FittedBox(fit: BoxFit.cover, child: Padding(padding: EdgeInsets.all(8.0), child: Text(text))),
        ],
      );
}
