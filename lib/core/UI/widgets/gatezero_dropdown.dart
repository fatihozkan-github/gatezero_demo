import 'package:flutter/material.dart';

import '../shared/colors.dart';

// ignore: must_be_immutable
class GateZeroDropdown extends StatelessWidget {
  dynamic value;
  final List items;
  final bool isExpanded;
  final Color fillColor;
  final Function(dynamic) onChanged;
  GateZeroDropdown({this.value, this.onChanged, this.items, this.isExpanded = true, this.fillColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(color: fillColor ?? UIColors.fillColor, borderRadius: BorderRadius.circular(20.0)),
      child: DropdownButton(
        value: value,
        items: items,
        isExpanded: isExpanded,
        onChanged: onChanged,
        underline: SizedBox(),
        dropdownColor: UIColors.fillColor,
        borderRadius: BorderRadius.circular(15.0),
      ),
    );
  }
}
