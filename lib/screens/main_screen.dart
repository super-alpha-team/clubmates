import 'package:clubmate/color_styles.dart';
import 'package:clubmate/components/custom_icons.dart';
import 'package:clubmate/screens/activity/activity_screen.dart';
import 'package:clubmate/screens/club/club_screen.dart';
import 'package:clubmate/screens/home/home_screen.dart';
import 'package:clubmate/screens/personal/personal_screen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _pages = [
    HomeScreen(),
    ActivityScreen(),
    ClubScreen(),
    PersonalScreen(),
  ];
  int _pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        children: _pages,
        index: _pageIndex,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: ColorStyles.orange,
        unselectedItemColor: ColorStyles.white,
        selectedItemColor: ColorStyles.darkBlue,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _pageIndex,
        onTap: (value) {
          setState(() {
            _pageIndex = value;
          });
        },
        items: [
          navItem(Icons.home, 33),
          navItem(CustomIcons.list, 22),
          navItem(CustomIcons.group, 30),
          navItem(CustomIcons.user, 30),
        ],
      ),
    );
  }

  BottomNavigationBarItem navItem(IconData icon, double size) {
    return BottomNavigationBarItem(
      icon: Icon(
        icon,
        size: size,
      ),
      label: '',
    );
  }
}
