import 'package:polygon_clipper/polygon_border.dart';
import 'package:flutter/material.dart';

class WECoin extends StatelessWidget {
  final double size;
  WECoin({this.size = 120});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: ShapeDecoration(
        gradient: LinearGradient(colors: [Color(0xFFff4d00), Color(0xffffab00)]),
        shadows: [BoxShadow(color: Colors.white, spreadRadius: 2, blurRadius: 4)],
        shape: PolygonBorder(sides: 6, borderRadius: 12.0, rotate: 30.0, border: BorderSide.none),
      ),
    );
  }
}
