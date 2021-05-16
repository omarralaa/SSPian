import 'package:flutter/material.dart';
import 'package:sspian/src/utils/constants.dart';

class TodayDate extends StatelessWidget {
  final DateTime selectedDate;

  TodayDate(this.selectedDate);

  @override
  Widget build(BuildContext context) {
    final monthName = Constants.monthNames[selectedDate.month - 1]
        .substring(0, 3)
        .toUpperCase();
    return Container(
      width: Constants.width * 0.15,
      height: Constants.height * 0.3,
      padding: EdgeInsets.only(top: Constants.height * 0.01),
      margin: EdgeInsets.only(right: Constants.width * 0.02),
      child: Column(
        children: [
          Text(
            monthName,
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: Constants.width * 0.05,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            selectedDate.day.toString().padLeft(2, '0'),
            style: TextStyle(
              color: Colors.black,
              fontSize: Constants.width * 0.05,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
