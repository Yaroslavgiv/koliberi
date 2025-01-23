import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'features/auth/views/login_screen.dart';
import 'features/auth/views/registration_screen.dart';
import 'features/auth/views/forgot_password_screen.dart';
import 'features/home/views/main_screen.dart';
import 'features/onboarding/views/onboarding_screen.dart';
import 'routes/app_routes.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.home, // Указываем стартовый маршрут
      getPages: [
        GetPage(
          name: AppRoutes.login,
          page: () => LoginScreen(),
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
      ],
    );
  }
}
