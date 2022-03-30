import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import '../../../../core/UI/presentation/view_base.dart';
import '../../../../core/UI/presentation/view_model_base.dart';
import '../../../../core/UI/shared/assets.dart';
import '../../../../core/UI/shared/colors.dart';
import '../../../../core/UI/shared/styles.dart';
import '../../../../core/UI/shared/utils.dart';
import '../../../../core/UI/widgets/overflow_handler.dart';
import '../../../../core/UI/widgets/widget_avatar_back_ground.dart';
import '../../../../core/models/model_friend.dart';
import '../../../../core/utils/utilities_general.dart';
import '../../../../core/models/model_user.dart';
import '../../../../providers/provider_user.dart';

class OtherProfileView extends StatefulWidget {
  final FriendModel friendModel;
  OtherProfileView({this.friendModel});
  @override
  _OtherProfileViewState createState() => _OtherProfileViewState();
}

class _OtherProfileViewState extends State<OtherProfileView> {
  @override
  Widget build(BuildContext context) {
    return BaseView(
      model: BaseViewModel(),
      builder: (_, BaseViewModel vm, __) {
        return Scaffold(
          backgroundColor: UIColors.tertiaryColor,
          appBar: AppBar(title: OverFlowHandler(child: Text(widget.friendModel.name.toString()))),
          body: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              AvatarBackgroundWidget(image: widget.friendModel.avatar),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    GeneralUtils.hasData(widget.friendModel.superhero) ? widget.friendModel.superhero + ' | ' : '',
                    style: UIStyles.titleStyle,
                  ),
                  Text(
                    'Level ' + widget.friendModel.level.toString() == 'Level 0'
                        ? 'Level 1'
                        : 'Level ' + widget.friendModel.level.toString(),
                    style: UIStyles.titleStyle,
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.all(8.0), child: _getDetailWidgets(widget.friendModel)),
              _getButtons(widget.friendModel, vm),
            ],
          ),
        );
      },
    );
  }

  _getButtons(FriendModel friendModel, BaseViewModel vm) {
    UserProvider userProvider = Provider.of<UserProvider>(context, listen: true);
    UserModel _currentUser = userProvider.currentUser;
    return (friendModel.id != _currentUser.uID)
        ? Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(),
              _currentUser.friends.contains(friendModel)
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
                        userProvider.addFriend(friendModel);
                        print(userProvider.currentUser.friends);
                        setState(() {});
                      },
                    ),
              SizedBox(height: 30),
              _currentUser.friends.contains(friendModel)
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
                child: ElevatedButton(child: Text('Meydan Okumalar'), onPressed: () => vm.navigateTo('/view_challenges')),
              ),
            ],
          );
  }

  _getDetailWidgets(FriendModel friendData) => GridView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        children: [
          _getDetailWidget("${friendData.coins ?? 0}", "WE Coin", UIAssets.coinIcon),
          _getDetailWidget("${friendData.recycled ?? 0} g", "Dönüştürüldü", UIAssets.recycleSignIcon),
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
