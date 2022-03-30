import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';

/// • Loading animation for WE.
class LoadingWidget extends StatefulWidget {
  final Color color;
  final double size;
  LoadingWidget({this.color, this.size});

  @override
  State<LoadingWidget> createState() => _LoadingWidgetState();
}

class _LoadingWidgetState extends State<LoadingWidget> with SingleTickerProviderStateMixin {
  @override
  Widget build(context) => Center(child: SpinKitSpinningLines(color: widget.color ?? Colors.purple, size: widget.size ?? 50.0));
}
