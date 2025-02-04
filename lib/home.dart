import 'package:evently/app_theme.dart';
import 'package:evently/create_event_screen.dart';
import 'package:evently/edit_or_remove.dart';
import 'package:evently/models/settings_provider.dart';
import 'package:evently/nav_bar_icon.dart';
import 'package:evently/tabs/Home/home_screen.dart';
import 'package:evently/tabs/Love/love_screen.dart';
import 'package:evently/tabs/Map/map_screen.dart';
import 'package:evently/tabs/Profile/profile_screen.dart';
import 'package:evently/update_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  List<Widget> tabs = [
    HomeScreen(),
    LoveScreen(),
    MapScreen(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      extendBody: true,
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomAppBar(
        notchMargin: 5,
        shape: CircularNotchedRectangle(),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        color: AppTheme.primary,
        padding: EdgeInsets.zero,
        child: BottomNavigationBar(
          elevation: 0,
          currentIndex: _currentIndex,
          onTap: (index) {
            _currentIndex = index;
            setState(() {});
          },
          backgroundColor: Theme.of(context).bottomAppBarTheme.color,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: AppTheme.white,
          unselectedItemColor: AppTheme.white,
          items: [
            BottomNavigationBarItem(
              icon: NavBarIcon(imageName: 'Home'),
              activeIcon: NavBarIcon(imageName: 'Home_active'),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: NavBarIcon(imageName: 'Map'),
              activeIcon: NavBarIcon(imageName: 'Map_active'),
              label: 'Map',
            ),
            BottomNavigationBarItem(
              icon: NavBarIcon(imageName: 'Love'),
              activeIcon: NavBarIcon(imageName: 'Love_active'),
              label: 'Love',
            ),
            BottomNavigationBarItem(
              icon: NavBarIcon(imageName: 'Profile'),
              activeIcon: NavBarIcon(imageName: 'Profile_active'),
              label: 'Profile',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        backgroundColor:
            Theme.of(context).floatingActionButtonTheme.backgroundColor,
        foregroundColor:
            Theme.of(context).floatingActionButtonTheme.foregroundColor,
        shape: CircleBorder(
          side: BorderSide(
            width: 5.w,
            color: Color(0xffFFFFFF),
          ),
        ),
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => CreateEventScreen()),
        ),
        child: Icon(
          Icons.add,
          size: 36.sp,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
