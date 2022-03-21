import 'package:flutter/material.dart';

import '../../screens/bottom_navigation/bottom_navigation.dart';

class ObserverWidget extends StatefulWidget {
  final Widget child;
  ObserverWidget({this.child});

  @override
  _ObserverWidgetState createState() => _ObserverWidgetState();
}

class _ObserverWidgetState extends State<ObserverWidget> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  Future<void> dispose() async {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    await Navigator.pushNamedAndRemoveUntil(context, '/bottom_navigation', (Route<dynamic> route) => route is BottomNavigation);
  }

  @override
  Widget build(BuildContext context) => widget.child;
}
