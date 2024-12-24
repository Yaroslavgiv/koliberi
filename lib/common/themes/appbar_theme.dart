import 'package:flutter/material.dart';

import '../styles/colors.dart';

class KAppBarTheme {
  KAppBarTheme._();

  static const lightAppBarTheme = AppBarTheme(
    backgroundColor: KColors.backgroundLight,
    titleTextStyle: TextStyle(
        fontSize: 18.0, fontWeight: FontWeight.bold, color: KColors.primary),
  );

  static const darkAppBarTheme = AppBarTheme(
    backgroundColor: KColors.backgroundDark,
    titleTextStyle: TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.bold,
        color: KColors.textPrimary),
  );
}
