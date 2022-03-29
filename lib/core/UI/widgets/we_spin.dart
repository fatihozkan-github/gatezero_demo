import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';

/// • Loading animation for WE.
class WESpinKit extends StatefulWidget {
  final Color color;
  final double size;
  WESpinKit({this.color, this.size});

  @override
  State<WESpinKit> createState() => _WESpinKitState();
}

class _WESpinKitState extends State<WESpinKit> with SingleTickerProviderStateMixin {
  @override
  Widget build(context) => Center(child: SpinKitSpinningLines(color: widget.color ?? Colors.purple, size: widget.size ?? 50.0));
}
