import 'package:flutter/material.dart';
import 'package:sspian/src/Widgets/upper_squares_home.dart';

class CoursesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(top: 20.0, left: 15.0),
          child: GestureDetector(onTap: (){},child: Text("Select", style: TextStyle(color: Colors.black),)),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(icon: Icon(Icons.search_rounded, color: Colors.black), onPressed: () {},),
          ),
        ],
        elevation: 0,
        flexibleSpace: UpperSquaresHome(),
        backgroundColor: Colors.red.withOpacity(0),
      ),
    );
  }
}