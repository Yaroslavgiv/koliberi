import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../data/repositories/auth_repository.dart';
import '../../../routes/app_routes.dart';

/// Контроллер для обработки действий пользователя:
/// - Регистрация (/account/register)
/// - Логин (/account/login)
/// - (Дополнительно) Сброс пароля, если нужно
class AuthController extends GetxController {
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final roleController = TextEditingController(); // Храним 'buyer' или 'seller'

  final AuthRepository _authRepository = AuthRepository();

  final box = GetStorage();

  /// Регистрация пользователя
  Future<void> register() async {
    final userName = userNameController.text.trim();
    final password = passwordController.text.trim();
    final confirmPassword = confirmPasswordController.text.trim();
    final role = roleController.text.trim(); // 'buyer' или 'seller'

    // 1. Проверяем, что поля не пустые
    if (userName.isEmpty || password.isEmpty || role.isEmpty) {
      Get.snackbar('Ошибка', 'Введите логин, пароль и выберите роль');
      return;
    }

    // 2. Проверка совпадения паролей
    if (password != confirmPassword) {
      Get.snackbar('Ошибка', 'Пароли не совпадают');
      return;
    }

    // 3. Шлём запрос
    try {
      await _authRepository.register(userName, password, role);
      Get.snackbar('Успех', 'Вы успешно зарегистрировались');
      // Если успех:
      box.write('loggedIn', true);
      Get.offAllNamed(AppRoutes.home);
    } catch (e) {
      Get.snackbar('Ошибка', e.toString());
    }
  }

  /// Логин
  Future<void> login() async {
    final userName = userNameController.text.trim();
    final password = passwordController.text.trim();

    if (userName.isEmpty || password.isEmpty) {
      Get.snackbar('Ошибка', 'Введите логин и пароль');
      return;
    }

    try {
      await _authRepository.login(userName, password);
      // Успешный логин => записать "loggedIn"
      box.write('loggedIn', true);
      Get.snackbar('Успех', 'Вы успешно вошли');
      Get.offAllNamed(AppRoutes.home);
    } catch (e) {
      Get.snackbar('Ошибка', e.toString());
    }
  }

  /// Сброс пароля — если ваше API это поддерживает
  Future<void> resetPassword() async {
    // ...
  }
}
