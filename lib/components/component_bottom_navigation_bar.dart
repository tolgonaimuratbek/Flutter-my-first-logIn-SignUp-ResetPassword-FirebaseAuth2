import 'package:flutter/material.dart';
import '../screens_bottomnavigationbar/home_screen.dart';
import '../screens_bottomnavigationbar/lerneinheit_screen.dart';
import '../screens_bottomnavigationbar/zuletzt_screen.dart';
import '../screens_bottomnavigationbar/chat_screen.dart';
import '../screens_bottomnavigationbar/kurse_screen.dart';
import '../constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyBottomNavigationBar extends StatefulWidget {
  State<MyBottomNavigationBar> createState() => _MyBottomNavigationBar();
}

class _MyBottomNavigationBar extends State<MyBottomNavigationBar> {
  final List<Widget> _pages = [
    HomeScreen(),
    LerneinheitScreen(),
    ZuletztScreen(),
    ChatScreen(),
    KurseScreen(),
  ];
  int _selectedPageIndex = 0;
  void _selectedPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedPageIndex],
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: kColourYellowMain,
        selectedItemColor: kColourGreyMain,
        currentIndex:
            _selectedPageIndex, //tell the buttonNavigation which page is actually selected
        type: BottomNavigationBarType
            .fixed, //changing the style of the navi bar - use type
        onTap: _selectedPage,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.house),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.book),
            label: 'Lerneinheit',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.heart),
            label: 'Zuletzt',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.message),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.graduationCap),
            label: 'Kurse',
          ),
        ],
      ),
    );
  }
}
