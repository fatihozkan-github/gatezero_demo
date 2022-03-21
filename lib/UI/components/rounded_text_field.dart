import 'package:flutter/material.dart';

import '../../utils/utilities_form.dart';
import '../design_materials/DM_colors.dart';

class RoundedTextField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final TextInputType keyboardType;
  final ValueChanged<String> onChanged;
  final bool obscureText;
  final Widget suffixIcon;
  final TextInputAction textInputAction;
  final String Function(String) validator;
  final Function onEditingComplete;
  final Function onTap;
  final String initialValue;
  final bool showIcon;
  final int maxLines;
  final EdgeInsets padding;
  final TextEditingController controller;
  final Widget customPrefixIcon;
  final TextCapitalization textCapitalization;
  final bool isActivated;

  /// • For a password field with a toggle button do NOT use [TextInputAction.next], instead consider the following:
  ///
  /// {@tool snippet}
  ///             onEditingComplete: () {
  ///                FocusScope.of(context).nextFocus();
  ///                FocusScope.of(context).nextFocus();
  ///             },
  /// {@end-tool}
  RoundedTextField({
    Key key,
    this.hintText,
    this.icon = Icons.person,
    this.onChanged,
    this.keyboardType,
    this.obscureText = false,
    this.suffixIcon,
    this.textInputAction,
    this.validator,
    this.onEditingComplete,
    this.initialValue,
    this.showIcon = true,
    this.maxLines = 1,
    this.padding,
    this.controller,
    this.customPrefixIcon,
    this.textCapitalization = TextCapitalization.none,
    this.isActivated = true,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.symmetric(vertical: 4.0),
      child: TextFormField(
        initialValue: initialValue,
        controller: controller,
        onChanged: onChanged,
        maxLines: maxLines,
        minLines: 1,
        textInputAction: textInputAction ?? TextInputAction.next,
        keyboardType: keyboardType,
        cursorColor: UIColors.primaryColor,
        obscureText: obscureText,
        onEditingComplete: onEditingComplete,
        autocorrect: false,
        onTap: onTap ?? null,
        textCapitalization: textCapitalization,
        readOnly: !isActivated,
        validator: validator ?? (_typed) => FormUtils.notEmpty(_typed),
        decoration: InputDecoration(
          prefixIcon: showIcon
              ? Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.0),
                  child: customPrefixIcon != null ? customPrefixIcon : Icon(icon, color: UIColors.primaryColor))
              : null,
          suffixIcon: suffixIcon,
          hintText: hintText,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0), borderSide: BorderSide.none),
          filled: true,
          fillColor: UIColors.fillColor,
          errorMaxLines: 2,
        ),
      ),
    );
  }
}
