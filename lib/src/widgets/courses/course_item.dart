import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:sspian/src/models/course.dart';
import 'package:sspian/src/utils/factory_utils.dart';
import 'package:sspian/src/utils/utils.dart';
import 'package:random_color/random_color.dart';

class CourseItem extends StatelessWidget {
  final Course course;
  const CourseItem(this.course);

  @override
  Widget build(BuildContext context) {
    RandomColor _randomColor = RandomColor();

    Color _color = _randomColor.randomColor();
    final FactoryUtils factoryUtils = FactoryUtils();
    return InkWell(
      child: Container(
        margin: EdgeInsets.symmetric(
            horizontal: Utils.size.width * 0.02,
            vertical: Utils.size.height * 0.01),
        decoration: BoxDecoration(
          color: _color,
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        child: Container(
          margin: EdgeInsets.only(bottom: Utils.size.height * 0.005),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                factoryUtils.getIconByDepartment(course.department),
                size: 40,
                color: _color,
              ),
              Text(
                course.name,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              Text(
                '${course.code}',
                style: TextStyle(color: Colors.black38),
              ),
              OutlinedButton(
                onPressed: () {},
                child: Text(
                  "View Course",
                  style: TextStyle(color: _color),
                ),
              )
            ],
          ),
        ),
      ),
      onTap: () {},
    );
  }
}
