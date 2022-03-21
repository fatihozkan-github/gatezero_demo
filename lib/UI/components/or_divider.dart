import 'package:flutter/material.dart';

import '../design_materials/DM_colors.dart';

/// • Divider with a text in the middle.
class OrDivider extends StatelessWidget {
  final String text;
  final double spaceAround;
  OrDivider({@required this.text, this.spaceAround = 0.0})
      : assert(text != null, 'OrDivider without a text is meaningless. Consider to use a typical Divider');

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Row(
        children: <Widget>[
          SizedBox(width: 10),
          Expanded(child: Divider(color: Colors.orange, thickness: 1)),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: spaceAround),
            child: Text(text, style: TextStyle(color: UIColors.primaryColor, fontWeight: FontWeight.w600)),
          ),
          Expanded(child: Divider(color: Colors.orange, thickness: 1)),
          SizedBox(width: 10),
        ],
      ),
    );
  }
}
