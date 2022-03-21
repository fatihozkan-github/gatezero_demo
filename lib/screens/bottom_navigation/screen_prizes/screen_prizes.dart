import 'package:flutter/material.dart';
import 'package:gatezero_demo/UI/design_materials/mock_lists.dart';
import 'package:provider/provider.dart';
import 'package:sliding_number/sliding_number.dart';
import '../../../UI/components/over_scroll.dart';
import '../../../UI/components/prize_coupon.dart';
import '../../../UI/components/we_coin.dart';
import '../../../UI/design_materials/DM_assets.dart';
import '../../../UI/design_materials/DM_colors.dart';
import '../../../models/model_prize.dart';
import '../../../models/model_user.dart';
import '../../../providers/provider_user.dart';

class PrizesScreen extends StatefulWidget {
  @override
  State<PrizesScreen> createState() => _PrizesScreenState();
}

class _PrizesScreenState extends State<PrizesScreen> {
  @override
  Widget build(BuildContext context) {
    UserModel _currentUser = Provider.of<UserProvider>(context, listen: true).currentUser;
    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
            pinned: true,
            elevation: 0,
            floating: false,
            expandedHeight: 250.0,
            automaticallyImplyLeading: false,
            backgroundColor: Colors.transparent,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              collapseMode: CollapseMode.parallax,
              title: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Spacer(),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12.0),
                    decoration: BoxDecoration(
                      color: UIColors.primaryColor,
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20.0)),
                    ),
                    child: Row(
                      children: [
                        SlidingNumber(
                          number: _currentUser.coins,
                          style: TextStyle(color: Colors.white, fontSize: 25.0, fontWeight: FontWeight.bold),
                          duration: Duration(seconds: 2),
                          curve: Curves.fastOutSlowIn,
                        ),
                        WECoin(size: 40),
                      ],
                    ),
                  ),
                ],
              ),
              background: DecoratedBox(
                child: Image.asset(UIAssets.privilegeGif, fit: BoxFit.cover),
                position: DecorationPosition.foreground,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.center,
                    colors: [Colors.black38, UIColors.primaryColor.withOpacity(.2)],
                  ),
                ),
              ),
            ),
          ),
        ];
      },
      body: _getBody(_currentUser),
    );
  }

  OverScroll _getBody(_currentUser) => OverScroll(
        child: ListView(
          children: [
            for (PrizeModel prizeModel in Mocks.mockPrizeList) PrizeCoupon(prizeModel: prizeModel, userModel: _currentUser),
            SizedBox(height: 30),
          ],
        ),
      );
}
