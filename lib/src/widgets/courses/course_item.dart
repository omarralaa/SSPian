import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:sspian/src/models/course.dart';
import 'package:sspian/src/utils/utils.dart';

class CourseItem extends StatelessWidget {
  final Course course;
  final HashSet<String> enrolledIds;

  const CourseItem(this.course, this.enrolledIds);

  @override
  Widget build(BuildContext context) {
    bool isEnrolled = enrolledIds.contains(course.id);
    return ListTile(
      title: Text(course.name),
      subtitle: Text('${course.code} - ${course.creditHours} Credit Hours'),
      trailing: IconButton(
        icon: Icon(
          isEnrolled ? Icons.how_to_reg_outlined : Icons.add_circle_sharp,
          size: Utils.size.width * 0.07,
        ),
        color: isEnrolled ? Colors.green : Theme.of(context).primaryColor,
        onPressed: () {},
      ),
    );
  }
}
