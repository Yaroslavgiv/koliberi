import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Контроллер для обработки действий пользователя на экранах авторизации, регистрации и восстановления пароля.
class AuthController extends GetxController {
  // Контроллеры текстовых полей для ввода email и пароля.
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  /// Вход в систему с использованием Firebase.
  Future<void> login() async {
    try {
      // Здесь вызовите метод login из AuthRepository.
      Get.snackbar('Success', 'Login successful');
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  /// Регистрация нового пользователя.
  Future<void> register() async {
    try {
      // Здесь вызовите метод register из AuthRepository.
      Get.snackbar('Success', 'Registration successful');
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  /// Сброс пароля.
  Future<void> resetPassword() async {
    try {
      // Здесь вызовите метод resetPassword из AuthRepository.
      Get.snackbar('Success', 'Password reset email sent');
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }
}
