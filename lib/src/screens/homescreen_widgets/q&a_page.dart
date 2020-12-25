import 'package:flutter/material.dart';
import 'package:sspian/src/Widgets/upper_squares_home.dart';

class QandAPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.filter_list, color: Colors.black,), onPressed: (){},),
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