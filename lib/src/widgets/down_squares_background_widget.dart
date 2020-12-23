import 'package:flutter/material.dart';

class DownSquaresBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: - MediaQuery.of(context).size.width * .2,
      bottom: - MediaQuery.of(context).size.width * .32,
      child: Image(
        image: AssetImage('assets/images/down_squares.png'),
      ),
    );
  }
}