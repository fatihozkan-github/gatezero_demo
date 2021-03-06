import 'package:coupon_uikit/coupon_uikit.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/services/service_localization.dart';
import '../../../../providers/provider_user.dart';
import 'gatezero_coin.dart';
import '../../../../core/UI/shared/utils.dart';
import '../../data/models/model_prize.dart';
import '../../../../core/models/model_user.dart';

class PrizeWidget extends StatelessWidget {
  final PrizeModel prizeModel;
  final UserModel userModel;
  PrizeWidget({this.prizeModel, this.userModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.0),
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: CouponCard(
        height: 280,
        clockwise: true,
        borderRadius: 10,
        curvePosition: 200,
        backgroundColor: Color(0xfffae2c4),
        firstChild: Container(
          height: 300,
          padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 9.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(prizeModel.title),
                    IconButton(
                      icon: Icon(Icons.info_outline),
                      alignment: Alignment.centerRight,
                      padding: EdgeInsets.zero,
                      onPressed: () => UIUtils.showGenericPopUp(context, subTitle: prizeModel.subTitle),
                    ),
                  ],
                ),
              ),
              Expanded(flex: 5, child: Image.asset(prizeModel.photo))
            ],
          ),
        ),
        secondChild: Container(
          height: 80,
          padding: EdgeInsets.symmetric(horizontal: 12.0),
          decoration: BoxDecoration(border: Border(top: BorderSide(color: Colors.white, style: BorderStyle.solid))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  GateZeroCoin(size: 40),
                  SizedBox(width: 3),
                  Text(prizeModel.cost.toString(), style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))
                ],
              ),
              ElevatedButton(
                child: Text(LocalizationService.texts.joinTheDraw),
                onPressed: () async {
                  if (userModel.coins >= prizeModel.cost) {
                    Provider.of<UserProvider>(context, listen: false).updateCoin(-prizeModel.cost);
                    UIUtils.showToast(LocalizationService.texts.joinTheDrawSuccess, success: true);
                  } else if (userModel.coins < prizeModel.cost) {
                    UIUtils.showToast(LocalizationService.texts.joinTheDrawFailure, success: false);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
