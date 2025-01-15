import 'package:flutter/material.dart';

import '../styles/colors.dart';

/// Custom Class for Light & Dark Text Themes
class KTextTheme {
  KTextTheme._();

  static TextTheme lightTextTheme = const TextTheme(
    displayLarge: TextStyle(
        fontSize: 32.0, fontWeight: FontWeight.bold, color: KColors.primary),
    bodyLarge: TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.normal,
        color: KColors.textPrimary),
    bodyMedium: TextStyle(
        fontSize: 12.0,
        fontWeight: FontWeight.normal,
        color: KColors.textSecondary),
  );

  static TextTheme darkTextTheme = const TextTheme(
    displayLarge: TextStyle(
        fontSize: 32.0,
        fontWeight: FontWeight.bold,
        color: KColors.textPrimary),
    bodyLarge: TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.normal,
        color: KColors.textPrimary),
    bodyMedium: TextStyle(
        fontSize: 12.0,
        fontWeight: FontWeight.normal,
        color: KColors.textSecondary),
  );
}
