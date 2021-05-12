import 'package:flutter/material.dart';

import 'package:sspian/src/utils/constants.dart';

class SummaryCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: Constants.height * 0.1,
      right: -Constants.width * 0.05,
      child: Container(
        height: Constants.height * 0.1,
        width: Constants.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        padding: EdgeInsets.only(
          right: Constants.width * 0.08,
          //top: Utils.size.height * 0.02,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildDetailBox('assignments', 3),
            _buildDetailBox('projects', 1),
            _buildDetailBox('quizzes', 2),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailBox(String text, int count) {
    String countString =
        count / 10 != 0 ? count.toString().padLeft(2, '0') : count.toString();

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          countString,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        SizedBox(
          height: Constants.height * 0.005,
        ),
        Text(
          text.toUpperCase(),
          style: TextStyle(
            color: Color(0xffa4adb6),
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
