import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_jobs/app/views/calender_view/calender_view.dart';
import 'package:new_jobs/app/views/home_views/home_view.dart';
import 'package:new_jobs/app/views/notification_view/notification_view.dart';
import 'package:new_jobs/app/views/settings_view/settings_view.dart';

class NavbarView extends StatefulWidget {
  const NavbarView({super.key});

  @override
  State<NavbarView> createState() => _NavbarViewState();
}

class _NavbarViewState extends State<NavbarView> {
  int _selectedIndex = 0;
  final List<Widget> _pages = const [
    HomeView(),
    CalendarView(),
    NotificationView(),
    SettingsView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        transitionBuilder: (Widget child, Animation<double> animation) {
          return FadeTransition(opacity: animation, child: child);
        },
        child: _pages[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        iconSize: 25,
        selectedFontSize: 16,
        unselectedFontSize: 14,
        backgroundColor: Colors.black,
        selectedItemColor: const Color(0xFF4CA1FE),
        unselectedItemColor: const Color(0xFF4CA1FE).withOpacity(0.5),
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home, size: 30),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.calendar, size: 30),
            label: 'Calendar',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.bell, size: 30),
            label: 'Notification',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.gear_solid, size: 30),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
