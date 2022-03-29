import 'package:polygon_clipper/polygon_border.dart';
import 'package:flutter/material.dart';

import '../../utils/utilities_general.dart';

class WEAvatar extends StatelessWidget {
  final double size;
  final String image;
  final Color loaderColor;
  final Widget fallBackImage;
  final double loaderSize;
  final bool polygonBorder;

  WEAvatar({
    this.size = 48,
    this.image,
    this.loaderColor = Colors.white,
    this.fallBackImage,
    this.loaderSize = 30,
    this.polygonBorder = false,
  });
  @override
  Widget build(BuildContext context) {
    Widget _fallback = fallBackImage ?? Icon(Icons.account_circle_rounded, size: size ?? 30, color: loaderColor ?? Colors.grey);
    return Container(
      width: size,
      height: size,
      clipBehavior: Clip.antiAlias,
      decoration: polygonBorder
          ? ShapeDecoration(
              color: Colors.white,
              shadows: [BoxShadow(color: Colors.white, blurRadius: 3, spreadRadius: 4)],
              shape: PolygonBorder(sides: 6, borderRadius: 12.0, rotate: 0.0, border: BorderSide.none),
            )
          : BoxDecoration(shape: BoxShape.circle),
      child: !GeneralUtils.hasData(image)
          ? Center(child: _fallback)
          : Image.asset(
              image,
              fit: BoxFit.cover,
              errorBuilder: (context, url, error) => _fallback,
            ),
    );
  }
}
