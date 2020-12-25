import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sspian/src/Widgets/upper_squares_home.dart';
import 'package:sspian/src/providers/auth.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              icon: Icon(Icons.logout, color: Colors.black),
              onPressed: () => Provider.of<Auth>(context, listen: false).logout(),
            ),
          ),
        ],
        elevation: 0,
        flexibleSpace: UpperSquaresHome(),
        backgroundColor: Colors.red.withOpacity(0),
      ),
    );
  }
}
