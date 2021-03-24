import 'package:flutter/material.dart';
import 'package:sspian/src/screens/explore_courses_screen.dart';
import 'package:sspian/src/utils/utils.dart';

class AddCourseButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        margin: EdgeInsets.symmetric(
            horizontal: Utils.size.width * 0.02,
            vertical: Utils.size.height * 0.01),
        child: Container(
          margin: EdgeInsets.only(bottom: Utils.size.height * 0.005),
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
