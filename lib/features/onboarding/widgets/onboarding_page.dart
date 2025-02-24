import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kollibry/common/themes/theme.dart';

import '../../../common/styles/colors.dart';
import '../../../common/styles/sizes.dart';
import '../../../common/themes/text_theme.dart';
import '../../../utils/constants/strings.dart';
import '../../../utils/device/screen_util.dart';

class OnboardingPage extends StatefulWidget {
  final String title;
  final String description;
  final String imagePath;
  final bool isLastPage;
  final VoidCallback? onLastPageButtonPressed;

  const OnboardingPage({
    super.key,
    required this.title,
    required this.description,
    required this.imagePath,
    this.isLastPage = false,
    this.onLastPageButtonPressed,
  });

  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 700),
    );

    _slideAnimation = Tween<Offset>(
      begin: Offset(0, 1),
      end: Offset(0, 0),
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Фоновое изображение
        Positioned.fill(
          child: Image.asset(
            widget.imagePath,
            fit: BoxFit.cover,
          ),
        ),
        // Полупрозрачный контейнер для текста
        Align(
          alignment: Alignment.bottomCenter,
          child: SlideTransition(
            position: _slideAnimation,
            child: Container(
              margin: EdgeInsets.all(ScreenUtil.adaptiveWidth(20)),
              padding: EdgeInsets.all(ScreenUtil.adaptiveWidth(20)),
              decoration: BoxDecoration(
                color:
                    KColors.borderDark.withOpacity(0.6), // Полупрозрачный фон
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    widget.title,
                    style: TAppTheme.lightTheme.textTheme.displaySmall,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: ScreenUtil.adaptiveHeight(10)),
                  Text(
                    widget.description,
                    style: TAppTheme.lightTheme.textTheme.bodyLarge,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: ScreenUtil.adaptiveHeight(20),
                  ),
                  if (widget.isLastPage)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              Get.toNamed('/register');
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: KColors.borderDark,
                              padding: EdgeInsets.symmetric(
                                horizontal: ScreenUtil.adaptiveWidth(40),
                                vertical: ScreenUtil.adaptiveHeight(10),
                              ),
                            ),
                            child: Text(
                              Strings.addRegisterButton,
                              style: KTextTheme.lightTextTheme.bodyLarge,
                            ),
                          ),
                        ),
                        SizedBox(width: ScreenUtil.adaptiveWidth(10)),
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () {
                              Get.toNamed('/login');
                            },
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(color: Colors.white),
                              padding: EdgeInsets.symmetric(
                                horizontal: ScreenUtil.adaptiveWidth(40),
                                vertical: ScreenUtil.adaptiveHeight(10),
                              ),
                            ),
                            child: Text(
                              Strings.loginButton,
                              style: KTextTheme.lightTextTheme.bodyLarge,
                            ),
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
    );
  }
}
