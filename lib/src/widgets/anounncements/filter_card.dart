import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:sspian/src/utils/utils.dart';

class FilterCard extends StatefulWidget {
  @override
  _FilterCardState createState() => _FilterCardState();
}

class _FilterCardState extends State<FilterCard> {
  int _selectedIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: Utils.size.height * 0.12,
      right: -Utils.size.width * 0.05,
      child: Container(
        height: Utils.size.height * 0.06,
        width: Utils.size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        padding: EdgeInsets.only(
          left: Utils.size.width * 0.03,
          right: Utils.size.width * 0.08,
          //top: Utils.size.height * 0.02,
        ),
        child: ListView(scrollDirection: Axis.horizontal, children: [
          _buildFilterButton(0, 'All Items', () {}),
          _buildFilterButton(1, 'Announcements', () {}),
          _buildFilterButton(2, 'Assignments', () {}),
          _buildFilterButton(3, 'Projects', () {}),
          _buildFilterButton(4, 'Quizzes', () {}),
        ]),
      ),
    );
  }

  Widget _buildFilterButton(int index, String text, Function handler) {
    bool isSelected = index == _selectedIndex;
    return TextButton(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: Utils.size.width * 0.016),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: TextStyle(
                color: isSelected
                    ? Theme.of(context).accentColor
                    : Color(0xff75747c),
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
            if (_selectedIndex == index)
              Container(
                height: Utils.size.height * 0.0025,
                width: Utils.size.width * 0.02,
                color: Theme.of(context).accentColor,
                margin: EdgeInsets.only(
                  top: Utils.size.height * 0.005,
                ),
              )
          ],
        ),
      ),
      onPressed: () {
        setState(() => _selectedIndex = index);
        handler();
      },
    );
  }
}
