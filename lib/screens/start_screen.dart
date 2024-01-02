import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:enefty_icons/enefty_icons.dart';
import 'package:provider/provider.dart';

//Providers
import '../providers/real_estate_provider.dart';

//Screens
import '../screens/home_screen.dart';
import '../screens/favorite_screen.dart';
import '../screens/dummy_screen.dart';

class StartScreen extends StatefulWidget {
  static const routeName = '/start-screen';

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  int selectedIndex = 0;

  final screens = [
    HomeScreen(),
    FavoriteScreen(),
    DummyScreen(pageTitle: 'Settings'),
    DummyScreen(pageTitle: 'Profile'),
  ];

  bool isInit = true;

  @override
  void initState() {
    super.initState();

    if (isInit) {
      Provider.of<RealEstateProvider>(context, listen: false).loadRealEstates();
    }

    isInit = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: screens[selectedIndex],
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          elevation: 0,
          indicatorColor: Colors.transparent,
          labelTextStyle: MaterialStateProperty.all(
            GoogleFonts.roboto(
              color: Colors.grey,
              fontSize: 12,
            ),
          ),
        ),
        child: NavigationBar(
          elevation: 0,
          height: 70,
          backgroundColor: Colors.white,
          selectedIndex: selectedIndex,
          onDestinationSelected: (index) => setState(() {
            selectedIndex = index;
          }),
          destinations: [
            NavigationDestination(
              selectedIcon: Icon(
                EneftyIcons.house_2_bold,
                color: Colors.cyan.shade400,
                size: 30,
              ),
              icon: const Icon(
                EneftyIcons.house_2_outline,
                color: Colors.grey,
                size: 30,
              ),
              label: 'Home',
            ),
            NavigationDestination(
              selectedIcon: Icon(
                EneftyIcons.heart_bold,
                color: Colors.cyan.shade400,
                size: 30,
              ),
              icon: const Icon(
                EneftyIcons.heart_outline,
                color: Colors.grey,
                size: 30,
              ),
              label: 'Favorite',
            ),
            NavigationDestination(
              selectedIcon: Icon(
                EneftyIcons.setting_2_bold,
                color: Colors.cyan.shade400,
                size: 30,
              ),
              icon: const Icon(
                EneftyIcons.setting_2_outline,
                color: Colors.grey,
                size: 30,
              ),
              label: 'Settings',
            ),
            NavigationDestination(
              selectedIcon: Icon(
                EneftyIcons.profile_bold,
                color: Colors.cyan.shade400,
                size: 30,
              ),
              icon: const Icon(
                EneftyIcons.profile_outline,
                color: Colors.grey,
                size: 30,
              ),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
