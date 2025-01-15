import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/styles/colors.dart';
import '../../../routes/app_routes.dart';
import '../../../utils/constants/strings.dart';
import '../../../utils/device/screen_util.dart';
import '../controllers/auth_controller.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';

class LoginScreen extends StatelessWidget {
  final AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Верхний цветной фон
          Positioned.fill(
            child: Container(
              color: KColors.primary, // Основной цвет фона из KColors
            ),
          ),
          // Закругленная белая область снизу
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: ScreenUtil.percentHeight(65), // Адаптивная высота области
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
                      Strings.loginTitle, // Текст заголовка из Strings
                      style: Theme.of(context).textTheme.bodyMedium,
                      textAlign: TextAlign.center,
                    ),
                    // Отступ после заголовка
                    SizedBox(
                      height:
                          ScreenUtil.adaptiveHeight(20), // Адаптивный отступ
                    ),
                    // Поле для ввода email
                    CustomTextField(
                      hintText: Strings.emailHint, // Подсказка из Strings
                      controller: authController
                          .emailController, // Контроллер для поля email
                      prefixIcon: Icons.email, // Иконка для email
                    ),
                    SizedBox(
                      height:
                          ScreenUtil.adaptiveHeight(16), // Отступ между полями
                    ),
                    // Поле для ввода пароля
                    CustomTextField(
                      hintText: Strings.passwordHint, // Подсказка для пароля
                      controller: authController
                          .passwordController, // Контроллер для пароля
                      obscureText: true, // Скрытие текста
                      prefixIcon: Icons.lock, // Иконка для пароля
                    ),
                    SizedBox(
                      height: ScreenUtil.adaptiveHeight(
                          10), // Отступ после поля пароля
                    ),
                    // Ссылка на экран восстановления пароля
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () => Get.toNamed(AppRoutes
                            .forgotPassword), // Переход на экран восстановления
                        child: Text(
                          Strings.forgotPasswordTitle, // Текст ссылки
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                    ),
                    SizedBox(
                      height:
                          ScreenUtil.adaptiveHeight(20), // Отступ перед кнопкой
                    ),
                    // Кнопка входа
                    CustomButton(
                      text: Strings.loginButton, // Текст кнопки из Strings
                      onPressed: () => authController.login(), // Логика входа
                    ),
                    SizedBox(
                      height:
                          ScreenUtil.adaptiveHeight(16), // Отступ после кнопки
                    ),
                    // Ссылка на регистрацию
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          Strings.newUserText, // Текст "Нет аккаунта?"
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        TextButton(
                          onPressed: () => Get.toNamed(AppRoutes
                              .register), // Переход на экран регистрации
                          child: Text(
                            Strings.signUpLink, // Текст "Зарегистрироваться"
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
