import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color lightGrey = Color(0xFFE4DFDF);
  static const Color grey = Color(0xFFB0B0B0);
  static const Color darkGrey = Color(0xFF495057);
  static const Color dirtyWhite = Color(0xFFF9F9F9);
  static const Color orange = Color(0xFFFCC127);

  static getDefault() {
    final theme = ThemeData();
    return theme.copyWith(
      colorScheme: theme.colorScheme.copyWith(
        primary: const Color(0xFFFCC127),
        primaryVariant: const Color(0xFFF3B000),
        background: const Color(0xFFF8F8F8),
      ),
      textTheme: GoogleFonts.poppinsTextTheme(),
    );
  }
}
