import 'package:flutter/material.dart';

import '../../../common/styles/colors.dart';
import '../../../common/themes/text_theme.dart';

/// Кастомный виджет для кнопки с закругленными углами.
class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomButton({Key? key, required this.text, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,

      style: ElevatedButton.styleFrom(
        backgroundColor: KColors.primary, // Основной цвет кнопки.
        minimumSize: const Size(double.infinity, 50), // Размер кнопки.
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0), // Закругленные углы.
        ),
      ),
      child: Text(
        text,
        style: TextStyle(color: KColors.borderLight),
      ), // Текст кнопки.
    );
  }
}
