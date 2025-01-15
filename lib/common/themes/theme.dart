import 'package:flutter/material.dart';

import '../styles/colors.dart';
import 'appbar_theme.dart';
import 'bottom_sheet_theme.dart';
import 'chip_theme.dart';
import 'elevated_button_theme.dart';
import 'outlined_button_theme.dart';
import 'text_field_theme.dart';
import 'text_theme.dart';

class TAppTheme {
  TAppTheme._();

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    fontFamily: 'Poppins',
    primaryColor: KColors.primary,
    scaffoldBackgroundColor: KColors.backgroundLight,
    textTheme: KTextTheme.lightTextTheme,
    appBarTheme: KAppBarTheme.lightAppBarTheme,
    elevatedButtonTheme: KElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: KOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: KTextFormFieldTheme.lightInputDecorationTheme,
    chipTheme: KChipTheme.lightChipTheme,
    bottomSheetTheme: KBottomSheetTheme.lightBottomSheetTheme,
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    fontFamily: 'Poppins',
    primaryColor: KColors.primary,
    scaffoldBackgroundColor: KColors.backgroundDark,
    textTheme: KTextTheme.darkTextTheme,
    appBarTheme: KAppBarTheme.darkAppBarTheme,
    elevatedButtonTheme: KElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: KOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: KTextFormFieldTheme.darkInputDecorationTheme,
    chipTheme: KChipTheme.darkChipTheme,
    bottomSheetTheme: KBottomSheetTheme.darkBottomSheetTheme,
  );
}
