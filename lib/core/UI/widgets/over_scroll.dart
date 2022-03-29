import 'package:flutter/material.dart';

class OverScroll extends StatelessWidget {
  /// • Simple widget that removes the trailing of the Scrollable Widgets.
  ///
  /// • One may consider to use BouncingScrollPhysics() for ListView.
  ///
  /// • [child] parameter is required.
  OverScroll({@required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return NotificationListener<OverscrollIndicatorNotification>(
      child: child,
      // ignore: missing_return
      onNotification: (overScroll) {
        overScroll.disallowIndicator();
        return true;
      },
    );
  }
}
