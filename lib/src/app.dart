import 'package:flutter/material.dart';

import 'package:sspian/src/screens/home_screen.dart';
import 'package:sspian/src/screens/login_screen.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     return MaterialApp(
      title: 'SSPIAN',
      theme: ThemeData(
        primarySwatch: Colors.red,
        accentColor: Colors.grey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
      routes: {
        LoginScreen.routeName: (ctx) => LoginScreen()
      }
    );
  }
}