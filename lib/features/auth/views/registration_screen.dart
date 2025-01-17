// Страница регистрации
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kollibry/common/styles/sizes.dart';

import '../../../common/styles/colors.dart';
import '../../../common/styles/image_strings.dart';
import '../../../routes/app_routes.dart';
import '../../../utils/constants/strings.dart';
import '../../../utils/device/screen_util.dart';
import '../controllers/auth_controller.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';

class RegistrationScreen extends StatelessWidget {
  final AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Верхняя синяя часть экрана
          Positioned.fill(
            child: Container(
              padding: EdgeInsets.only(
                bottom: ScreenUtil.adaptiveWidth(400),
              ),
              color: KColors.primary,
              child: Align(
                alignment: Alignment.topCenter,
                child: Image.asset(
                  KImages.logoWhite,
                  height: ScreenUtil.percentHeight(60.0),
                  width: ScreenUtil.percentWidth(80.0),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          // Плавающий белый контейнер
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.only(
                bottom: ScreenUtil.adaptiveWidth(70),
                right: ScreenUtil.adaptiveWidth(20),
                left: ScreenUtil.adaptiveWidth(20),
              ),
              padding: EdgeInsets.symmetric(
                vertical: ScreenUtil.adaptiveHeight(20),
                horizontal: ScreenUtil.adaptiveWidth(20),
              ),
              decoration: BoxDecoration(
                color: KColors.backgroundLight,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    Strings.registrationTitle,
                    style: Theme.of(context).textTheme.bodyMedium,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: ScreenUtil.adaptiveHeight(20)),
                  CustomTextField(
                    hintText: Strings.emailHint,
                    controller: authController.emailController,
                    prefixIcon: Icons.email,
                  ),
                  SizedBox(height: ScreenUtil.adaptiveHeight(16)),
                  CustomTextField(
                    hintText: Strings.passwordHint,
                    controller: authController.passwordController,
                    obscureText: true,
                    prefixIcon: Icons.lock,
                  ),
                  SizedBox(height: ScreenUtil.adaptiveHeight(16)),
                  CustomTextField(
                    hintText: Strings.confirmPasswordHint,
                    controller: authController.confirmPasswordController,
                    obscureText: true,
                    prefixIcon: Icons.lock_outline,
                  ),
                  SizedBox(height: ScreenUtil.adaptiveHeight(20)),
                  CustomButton(
                    text: Strings.registerButton,
                    onPressed: () => authController.register(),
                  ),
                  SizedBox(height: ScreenUtil.adaptiveHeight(16)),
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
        ],
      ),
    );
  }
}
