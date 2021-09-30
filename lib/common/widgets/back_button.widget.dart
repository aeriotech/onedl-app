import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class ScreenBackButton extends StatelessWidget {
  const ScreenBackButton({
    required this.color,
    Key? key,
    this.onClick,
  }) : super(key: key);

  final Color color;
  final VoidCallback? onClick;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 10.0,
      child: SafeArea(
        child: IconButton(
          onPressed: onClick,
          icon: Icon(
            IconlyLight.arrowLeft2,
            color: color,
            size: 32.0,
          ),
        ),
      ),
    );
  }
}
