import 'package:flutter/material.dart';
import 'package:sspian/src/utils/constants.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Constants.width = MediaQuery.of(context).size.width;
    Constants.height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Center(
        child: Image.asset('assets/images/logo_transparent.png'),
      ),
    );
  }
}
