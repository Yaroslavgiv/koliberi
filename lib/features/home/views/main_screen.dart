import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/styles/colors.dart';
import '../../../utils/constants/strings.dart';
import '../../../utils/device/screen_util.dart';
import '../../cart/controllers/cart_controller.dart';
import '../../cart/views/cart_screen.dart';
import '../../favorites/views/favorites_screen.dart';
import 'home_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  final CartController cartController = Get.put(CartController());

  final List<Widget> _pages = [
    HomePage(),
    FavoritesScreen(),
    CartScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: KColors.primary,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: KColors.backgroundLight,
                    child: Icon(Icons.person, size: 40, color: KColors.primary),
                  ),
                  SizedBox(height: ScreenUtil.adaptiveHeight(10)),
                  Text(
                    'User Name',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(color: KColors.textPrimary),
                  ),
                  Text(
                    'user@example.com',
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(color: KColors.textSecondary),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.dashboard, color: KColors.primary),
              title: Text(Strings.dashboard,
                  style: Theme.of(context).textTheme.bodyMedium),
              onTap: () {
                // Navigate to dashboard
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.settings, color: KColors.primary),
              title: Text(Strings.settings,
                  style: Theme.of(context).textTheme.bodyMedium),
              onTap: () {
                // Navigate to settings
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.logout, color: KColors.primary),
              title: Text(Strings.logout,
                  style: Theme.of(context).textTheme.bodyMedium),
              onTap: () {
                // Handle logout
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text(Strings.appName),
        backgroundColor: KColors.primary,
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: KColors.backgroundLight.withOpacity(0.9), // Полупрозрачный фон
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.8),
              blurRadius: 10,
              offset: Offset(0, -2), // Тень сверху
            ),
          ],
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          // type: BottomNavigationBarType.shifting,
          iconSize: 30,
          currentIndex: _currentIndex,
          elevation: 8.0,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          selectedItemColor: KColors.buttonDark,
          unselectedItemColor: KColors.buttonText,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: Strings.home,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: Strings.favorites,
            ),
            BottomNavigationBarItem(
              icon: Obx(() {
                final count = cartController.cartItems.length;
                return Stack(
                  children: [
                    Icon(Icons.shopping_cart),
                    if (count > 0)
                      Positioned(
                        right: 0,
                        child: Container(
                          padding: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                          child: Text(
                            '$count',
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ),
                      ),
                  ],
                );
              }),
              label: Strings.cart,
            ),
          ],
        ),
      ),
    );
  }
}
