import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:flutter/material.dart';

class WEPinField extends StatelessWidget {
  final Function(String) onChanged;
  final TextEditingController controller;
  WEPinField({@required this.onChanged, this.controller});

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      length: 4,
      obscureText: false,
      appContext: context,
      onChanged: onChanged,
      controller: controller,
      enableActiveFill: true,
      enablePinAutofill: false,
      animationType: AnimationType.fade,
      backgroundColor: Colors.transparent,
      mainAxisAlignment: MainAxisAlignment.center,
      autovalidateMode: AutovalidateMode.disabled,
      animationDuration: Duration(milliseconds: 300),
      textCapitalization: TextCapitalization.characters,
      inputFormatters: [UpperCaseTextFormatter()],
      pinTheme: PinTheme(
        fieldWidth: 50,
        fieldHeight: 60,
        inactiveColor: Colors.white,
        selectedColor: Colors.orange,
        shape: PinCodeFieldShape.box,
        activeFillColor: Colors.white,
        selectedFillColor: Colors.grey[100],
        inactiveFillColor: Colors.grey[300],
        borderRadius: BorderRadius.circular(10),
        fieldOuterPadding: EdgeInsets.symmetric(horizontal: 4.0),
      ),
    );
  }
}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(old, newV) => TextEditingValue(text: newV.text.toUpperCase(), selection: newV.selection);
}
