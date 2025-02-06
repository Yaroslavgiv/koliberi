import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Импорт GetX для маршрутов и состояния
import 'package:kollibry/common/themes/theme.dart';

// Импорты страниц и маршрутов приложения
import 'features/auth/views/login_screen.dart'; // Экран авторизации
import 'features/auth/views/registration_screen.dart'; // Экран регистрации
import 'features/auth/views/forgot_password_screen.dart'; // Экран восстановления пароля
import 'features/home/views/main_screen.dart'; // Главная страница приложения
import 'features/onboarding/views/onboarding_screen.dart'; // Страницы онбординга
import 'features/profile/views/delivery_point_screen.dart';
import 'features/profile/views/edit_profile_screen.dart';
import 'features/profile/views/profile_screen.dart';
import 'routes/app_routes.dart'; // Определение маршрутов

/// Главный класс приложения
class App extends StatelessWidget {
  App({super.key});

  /// Список всех маршрутов приложения
  final List<GetPage> _pages = [
    GetPage(
      name: AppRoutes.login, // Имя маршрута
      page: () => LoginScreen(), // Виджет страницы
    ),
    GetPage(
      name: AppRoutes.register,
      page: () => RegistrationScreen(),
    ),
    GetPage(
      name: AppRoutes.forgotPassword,
      page: () => ForgotPasswordScreen(),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => MainScreen(),
    ),
    GetPage(
      name: AppRoutes.onboarding,
      page: () => OnboardingScreen(),
    ),
    GetPage(
      name: '/profile',
      page: () => ProfileScreen(),
    ),
    GetPage(
      name: '/edit-profile',
      page: () => EditProfileScreen(),
    ),
    GetPage(
      name: '/delivery-point',
      page: () => DeliveryPointScreen(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.lightTheme, // Установка темной темы (по умолчанию)
      initialRoute: AppRoutes.home, // Указание начального маршрута
      // themeMode: ThemeMode.system, // **Автоматическое переключение**
      getPages: _pages, // Передача списка маршрутов в GetMaterialApp
      unknownRoute: GetPage(
        // Обработка неизвестных маршрутов
        name: '/not-found', // Имя маршрута
        page: () => Scaffold(
          // Страница, отображаемая при неизвестном маршруте
          body: Center(
            child: Text('Маршрут не найден'), // Текст сообщения
          ),
        ),
      ),
    );
  }
}
