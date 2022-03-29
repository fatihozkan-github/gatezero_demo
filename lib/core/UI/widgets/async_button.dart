import 'package:async_button_builder/async_button_builder.dart';
import 'package:flutter/material.dart';

import 'rounded_button.dart';
import 'we_spin.dart';

class AsyncButton extends StatelessWidget {
  final String label;
  final Widget iconWidget;
  final Function onPressed;
  final bool useElevatedButton;
  final bool useIconElevatedButton;
  AsyncButton({this.onPressed, this.label, this.useElevatedButton = false, this.useIconElevatedButton = false, this.iconWidget});

  @override
  Widget build(BuildContext context) {
    return AsyncButtonBuilder(
      showError: false,
      showSuccess: false,
      onPressed: onPressed,
      loadingWidget: WESpinKit(color: Colors.white, size: 25),
      child: Text(label, style: TextStyle(color: Colors.white)),
      builder: (context, child, callback, _) => !useElevatedButton
          ? RoundedButton(useCustomChild: true, customChild: child, onPressed: callback)
          : useIconElevatedButton
              ? ElevatedButton.icon(
                  icon: iconWidget,
                  label: child,
                  onPressed: callback,
                  style: ElevatedButton.styleFrom(padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12), shape: StadiumBorder()),
                )
              : ElevatedButton(
                  child: child,
                  onPressed: callback,
                  style: ElevatedButton.styleFrom(padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12), shape: StadiumBorder()),
                ),
    );
  }
}
