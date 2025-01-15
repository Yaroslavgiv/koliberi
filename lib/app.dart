import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'features/auth/views/login_screen.dart';
import 'features/auth/views/registration_screen.dart';
import 'features/auth/views/forgot_password_screen.dart';
import 'routes/app_routes.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: AppRoutes.login, // Указываем стартовый маршрут
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
      ],
    );
  }
}
