import 'package:flutter/material.dart';
import 'package:gatezero_demo/core/UI/widgets/we_avatar.dart';

import '../../../../core/UI/shared/assets.dart';
import '../../../../core/UI/shared/colors.dart';

/// • Duel bar for duels.
class DuelBar extends StatefulWidget {
  final int firstParameter;
  final int secondParameter;
  final String firstName;
  final String secondName;
  final String firstAvatar;
  final String secondAvatar;

  DuelBar({
    this.firstParameter = 0,
    this.secondParameter = 0,
    this.firstName = '',
    this.secondName = '',
    this.firstAvatar = '',
    this.secondAvatar = '',
  });

  @override
  State<DuelBar> createState() => _DuelBarState();
}

class _DuelBarState extends State<DuelBar> {
  double _firstRatio = 0;
  double _secondRatio = 0;

  _calculateRatio() {
    if (widget.firstParameter > 0 || widget.secondParameter > 0) {
      double ratio = 100 / (widget.firstParameter + widget.secondParameter);
      _firstRatio = ratio * widget.firstParameter;
      _secondRatio = ratio * widget.secondParameter;
    } else if (widget.firstParameter <= 0 || widget.secondParameter <= 0) {
      _firstRatio = 50;
      _secondRatio = 50;
    }
  }

  @override
  void initState() {
    _calculateRatio();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Column(
        children: [
          Row(children: [
            WEAvatar(image: widget.firstAvatar, fallBackImage: Image.asset(UIAssets.leaderBoardUserIcon)),
            SizedBox(width: 10),
            Text(widget.firstName)
          ]),
          SizedBox(height: 5),
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Row(
              children: [
                Expanded(
                  flex: _firstRatio.toInt(),
                  child: Container(
                    height: 60,
                    color: UIColors.primaryColor,
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text('%' + _firstRatio.toStringAsFixed(1), style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ),
                Expanded(
                  flex: _secondRatio.toInt(),
                  child: Container(
                    height: 60,
                    color: UIColors.secondaryColor,
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text('%' + _secondRatio.toStringAsFixed(1), style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(widget.secondName),
              SizedBox(width: 10),
              WEAvatar(image: widget.secondAvatar, fallBackImage: Image.asset(UIAssets.leaderBoardUserIcon))
            ],
          ),
        ],
      ),
    );
  }
}
