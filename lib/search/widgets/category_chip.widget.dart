import 'package:flutter/material.dart';

class CategoryChip extends StatelessWidget {
  const CategoryChip({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  TextStyle get _textStyle => const TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.bold,
      );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 10.0,
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Center(child: Text(text)),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              offset: const Offset(2.0, 2.0),
              blurRadius: 7.0,
              spreadRadius: 1.0,
              color: Colors.black.withOpacity(0.25),
            ),
          ],
        ),
      ),
    );
  }
}
