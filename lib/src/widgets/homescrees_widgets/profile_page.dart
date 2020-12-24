import 'package:flutter/material.dart';

import '../upper_squares_home.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(icon: Icon(Icons.logout, color: Colors.black), onPressed: () {},),
          ),
        ],
        elevation: 0,
        flexibleSpace: UpperSquaresHome(),
        backgroundColor: Colors.red.withOpacity(0),
      ),
    );
  }
}