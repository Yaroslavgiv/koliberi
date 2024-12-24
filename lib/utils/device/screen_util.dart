import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher_string.dart';

// Утилитарный класс для работы с экраном и устройством
class KScreensUtils {
  // Скрыть клавиатуру
  static void hideKeyboard(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  // Установить цвет статус-бара
  static Future<void> setStatusBarColor(Color color) async {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: color),
    );
  }

  // Проверить, находится ли устройство в горизонтальной ориентации
  static bool isLandscapeOrientation(BuildContext context) {
    final viewInsets = View.of(context).viewInsets;
    return viewInsets.bottom == 0; // Здесь учитываются отступы для клавиатуры
  }

  // Проверить, находится ли устройство в вертикальной ориентации
  static bool isPortraitOrientation(BuildContext context) {
    final viewInsets = View.of(context).viewInsets;
    return viewInsets.bottom != 0;
  }

  // Установить полноэкранный режим
  static void setFullScreen(bool enable) {
    SystemChrome.setEnabledSystemUIMode(
        enable ? SystemUiMode.immersiveSticky : SystemUiMode.edgeToEdge);
  }

  // Получить высоту экрана
  static double getScreenHeight() {
    return MediaQuery.of(Get.context!).size.height;
  }

  // Получить ширину экрана
  static double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  // Получить соотношение пикселей
  static double getPixelRatio() {
    return MediaQuery.of(Get.context!).devicePixelRatio;
  }

  // Получить высоту статус-бара
  static double getStatusBarHeight() {
    return MediaQuery.of(Get.context!).padding.top;
  }

  // Получить высоту нижней навигационной панели
  static double getBottomNavigationBarHeight() {
    return kBottomNavigationBarHeight;
  }

  // Получить высоту AppBar
  static double getAppBarHeight() {
    return kToolbarHeight;
  }

  // Получить высоту клавиатуры
  static double getKeyboardHeight() {
    final viewInsets = MediaQuery.of(Get.context!).viewInsets;
    return viewInsets.bottom;
  }

  // Проверить, отображается ли клавиатура
  static Future<bool> isKeyboardVisible() async {
    final viewInsets = View.of(Get.context!).viewInsets;
    return viewInsets.bottom > 0;
  }

  // Проверить, является ли устройство физическим
  static Future<bool> isPhysicalDevice() async {
    return defaultTargetPlatform == TargetPlatform.android ||
        defaultTargetPlatform == TargetPlatform.iOS;
  }

  // Вызвать вибрацию на устройстве
  static void vibrate(Duration duration) {
    HapticFeedback.vibrate();
    Future.delayed(duration, () => HapticFeedback.vibrate());
  }

  // Установить предпочтительные ориентации экрана
  static Future<void> setPreferredOrientations(
      List<DeviceOrientation> orientations) async {
    await SystemChrome.setPreferredOrientations(orientations);
  }

  // Скрыть статус-бар
  static void hideStatusBar() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  }

  // Показать статус-бар
  static void showStatusBar() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
  }

  // Проверить наличие интернет-соединения
  static Future<bool> hasInternetConnection() async {
    try {
      final result = await InternetAddress.lookup('example.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      return false;
    }
  }

  // Проверить, является ли устройство iOS
  static bool isIOS() {
    return Platform.isIOS;
  }

  // Проверить, является ли устройство Android
  static bool isAndroid() {
    return Platform.isAndroid;
  }

  // Открыть URL в браузере
  static void launchUrl(String url) async {
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  // Здесь можно добавить дополнительные утилиты для работы с устройством.
}
