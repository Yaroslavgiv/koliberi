// Главный класс приложения
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'common/themes/theme.dart';
import 'routes/app_routes.dart';

class App extends StatelessWidget {
  App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.lightTheme, // Установка темной темы (по умолчанию)
      initialRoute: AppRoutes.onboarding, // Указание начального маршрута
      getPages: AppRoutes.pages, // Передача списка маршрутов в GetMaterialApp
      unknownRoute: GetPage(
        name: AppRoutes.notFound,
        page: () => Scaffold(
          body: Center(
            child: Text('Маршрут не найден'),
          ),
        ),
      ),
    );
  }
}
