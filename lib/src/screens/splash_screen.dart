import 'package:flutter/material.dart';
import 'package:sspian/src/utils/utils.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Utils.size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Image.asset('assets/images/logo_transparent.png'),
      ),
    );
  }
}
