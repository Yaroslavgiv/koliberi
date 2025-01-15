import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/styles/colors.dart';
import '../../../routes/app_routes.dart';
import '../../../utils/constants/strings.dart';
import '../../../utils/device/screen_util.dart'; // Утилита для адаптивности
import '../controllers/auth_controller.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';

/// Экран регистрации пользователя
class RegistrationScreen extends StatelessWidget {
  final AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Верхний цветной фон
          Positioned.fill(
            child: Container(
              color: KColors.primary, // Основной цвет фона
            ),
          ),
          // Закругленная белая область снизу
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: ScreenUtil.percentHeight(70), // Адаптивная высота области
              decoration: const BoxDecoration(
                color: KColors.backgroundLight, // Цвет фона формы
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(60), // Закругление левого угла
                  topRight: Radius.circular(60), // Закругление правого угла
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: ScreenUtil.adaptiveWidth(20), // Адаптивный отступ
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Заголовок экрана
                    Text(
                      Strings.registrationTitle,
                      style: Theme.of(context).textTheme.bodyMedium,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: ScreenUtil.adaptiveHeight(20)),
                    // Поле Email
                    CustomTextField(
                      hintText: Strings.emailHint,
                      controller: authController.emailController,
                      prefixIcon: Icons.email,
                    ),
                    SizedBox(height: ScreenUtil.adaptiveHeight(16)),
                    // Поле Password
                    CustomTextField(
                      hintText: Strings.passwordHint,
                      controller: authController.passwordController,
                      obscureText: true,
                      prefixIcon: Icons.lock,
                    ),
                    SizedBox(height: ScreenUtil.adaptiveHeight(16)),
                    // Поле Confirm Password
                    CustomTextField(
                      hintText: Strings.confirmPasswordHint,
                      controller: authController.confirmPasswordController,
                      obscureText: true,
                      prefixIcon: Icons.lock_outline,
                    ),
                    SizedBox(height: ScreenUtil.adaptiveHeight(20)),
                    // Кнопка "Зарегистрироваться"
                    CustomButton(
                      text: Strings.registerButton,
                      onPressed: () => authController.register(),
                    ),
                    SizedBox(height: ScreenUtil.adaptiveHeight(16)),
                    // Ссылка на экран авторизации
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          Strings.alreadyHaveAccountText,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        TextButton(
                          onPressed: () => Get.toNamed(AppRoutes.login),
                          child: Text(
                            Strings.loginLink,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
