import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/styles/colors.dart';
import '../../../common/styles/sizes.dart';
import '../../../utils/constants/strings.dart';
import '../../../utils/device/screen_util.dart';
import '../../cart/views/cart_screen.dart';
import '../../favorites/views/favorites_screen.dart';
import '../../profile/views/profile_screen.dart';
import 'home_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    FavoritesPage(),
    CartPage(),
    // ProfilePage(),
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
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedItemColor: KColors.primary,
        unselectedItemColor: KColors.textSecondary,
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
            icon: Icon(Icons.shopping_cart),
            label: Strings.cart,
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.person),
          //   label: Strings.profile,
          // ),
        ],
      ),
    );
  }
}
