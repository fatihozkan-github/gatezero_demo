import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

import 'over_scroll.dart';
import 'overflow_handler.dart';

class RoundedListTile extends StatelessWidget {
  final Function onPressed;
  final Widget title;
  final Widget leading;
  final Widget trailing;
  final Widget subTitle;

  RoundedListTile({this.onPressed, this.leading, this.title, this.trailing, this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      margin: EdgeInsets.all(5.0),
      shadowColor: Colors.orange,
      elevation: 2,
      child: Center(
        child: ListTile(
          title: OverScroll(child: OverFlowHandler(child: title)),
          onTap: onPressed,
          leading: leading,
          trailing: trailing,
          subtitle: subTitle,
        ).padding(all: 4.0),
      ),
    );
  }
}
