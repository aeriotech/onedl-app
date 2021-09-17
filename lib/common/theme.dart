import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color grey = Color(0xFFE4DFDF);

  static getDefault() {
    final theme = ThemeData();
    return theme.copyWith(
      colorScheme: theme.colorScheme.copyWith(
        primary: const Color(0xFFFCC127),
        primaryVariant: const Color(0xFFF3B000),
      ),
      textTheme: GoogleFonts.poppinsTextTheme(),
    );
  }
}
