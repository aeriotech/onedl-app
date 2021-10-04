import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
    required this.name,
  }) : super(key: key);

  final String name;

  TextStyle get _textStyle => const TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42.0,
      color: Colors.blue,
      child: Center(
        child: Text(
          'Good morning $name!',
          style: _textStyle,
        ),
      ),
    );
  }
}
