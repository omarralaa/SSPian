import 'package:flutter/material.dart';

class UpperSquaresHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 23.0),
      child: Image(
        image: AssetImage('assets/images/Squares@3x (2).png'),
        fit: BoxFit.contain,
      ),
    );
  }
}
