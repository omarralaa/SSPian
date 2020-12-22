import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {

  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Hello World')
      ),
    );
  }
}