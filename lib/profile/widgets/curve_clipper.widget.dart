import 'package:flutter/material.dart';

class TopCurve extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final width = size.width;

    final path = Path();
    path.moveTo(-200, 0);
    path.quadraticBezierTo(width / 2.0, 370, width + 200, 0);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
