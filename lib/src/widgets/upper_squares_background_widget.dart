import 'package:flutter/material.dart';

class UpperSquaresBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: - MediaQuery.of(context).size.width * .2,
      top: - MediaQuery.of(context).size.width * .25,
      child: Image(
        image: AssetImage('assets/images/upper_squares.png'),
      ),
    );
  }
}