import 'package:flutter/material.dart';
import 'package:sspian/src/screens/explore_courses_screen.dart';
import 'package:sspian/src/utils/constants.dart';

class AddCourseButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        margin: EdgeInsets.symmetric(
            horizontal: Constants.width * 0.02,
            vertical: Constants.height * 0.01),
        child: Container(
          margin: EdgeInsets.only(bottom: Constants.height * 0.005),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
          child: Icon(Icons.add),
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ExploreCourses()),
        );
      },
    );
  }
}
