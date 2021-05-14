import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:sspian/src/utils/constants.dart';

class FilterCard extends StatelessWidget {
  final Function selectIndex;
  final int selectedIndex;

  FilterCard(this.selectedIndex, this.selectIndex);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: Constants.height * 0.09,
      right: -Constants.width * 0.05,
      child: Container(
        height: Constants.height * 0.06,
        width: Constants.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        padding: EdgeInsets.only(
          left: Constants.width * 0.03,
          right: Constants.width * 0.08,
          //top: Utils.size.height * 0.02,
        ),
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            _buildFilterButton(0, 'All Updates', () {}),
            _buildFilterButton(1, 'Deadlines', () {}),
            _buildFilterButton(2, 'Assignments', () {}),
            _buildFilterButton(3, 'Projects', () {}),
            _buildFilterButton(4, 'Quizzes', () {}),
            _buildFilterButton(5, 'Announcements', () {}),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterButton(int index, String text, Function handler) {
    bool isSelected = index == selectedIndex;
    return TextButton(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: Constants.width * 0.016),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: TextStyle(
                color: isSelected ? Color(0xff303842) : Color(0xff75747c),
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
            // if (_selectedIndex == index)
            //   Container(
            //     height: Utils.size.height * 0.0025,
            //     width: Utils.size.width * 0.02,
            //     color: Theme.of(context).accentColor,
            //     margin: EdgeInsets.only(
            //       top: Utils.size.height * 0.005,
            //     ),
            //   )
          ],
        ),
      ),
      onPressed: () {
        selectIndex(index);
        handler();
      },
    );
  }
}
