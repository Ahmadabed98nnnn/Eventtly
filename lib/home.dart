import 'package:evently/create_event_screen.dart';
import 'package:evently/edit_or_remove.dart';
import 'package:evently/nav_bar_icon.dart';
import 'package:evently/tabs/Home/home_screen.dart';
import 'package:evently/tabs/Love/love_screen.dart';
import 'package:evently/tabs/Map/map_screen.dart';
import 'package:evently/tabs/Profile/profile_screen.dart';
import 'package:evently/update_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
      extendBody: true,
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomAppBar(
        notchMargin: 5,
        shape: CircularNotchedRectangle(),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        color: Color(0xff5669FF),
        padding: EdgeInsets.zero,
        child: BottomNavigationBar(
          elevation: 0,
          currentIndex: _currentIndex,
          onTap: (index) {
            _currentIndex = index;
            setState(() {});
          },
          backgroundColor: Color(0xff5669FF),
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white,
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
        backgroundColor: Color(0xff5669FF),
        foregroundColor: Color(0xffFFFFFF),
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
