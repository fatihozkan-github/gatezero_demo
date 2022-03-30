import 'package:flutter/material.dart';

import '../../utils/utilities_enums.dart';
import 'we_spin.dart';

class CustomScaffold extends StatelessWidget {
  final ActivityState activityState;
  final Widget child;

  CustomScaffold({@required this.activityState, @required this.child});

  @override
  Widget build(BuildContext context) {
    if (activityState == ActivityState.isLoading)
      return WESpinKit();
    else if (activityState == ActivityState.error) return Center(child: Text("ERROR"));
    return child;
  }
}
