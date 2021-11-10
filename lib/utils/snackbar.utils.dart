import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Center(
        heightFactor: 1,
        child: Text(text),
      ),
    ),
  );
}
