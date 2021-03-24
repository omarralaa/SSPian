import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sspian/src/providers/course.dart';

import 'courses_screen.dart';
import 'profile_screen.dart';
import 'qanda_page.dart';
import 'updates_screen.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    UpdatesScreen(),
    CoursesScreen(),
    QandAPage(),
    ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: onTabTapped,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Theme.of(context).accentColor,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: "Dashboard",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.collections_bookmark),
            label: "Courses",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message_outlined),
            label: "Messages",
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), label: "Profile"),
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () => {},
      //   child: Icon(
      //     Icons.add,
      //     color: Colors.white,
      //   ),
      //   backgroundColor: Theme.of(context).primaryColor,
      // ),
      // floatingActionButtonLocation:
      //     FloatingActionButtonLocation.miniCenterFloat,
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
