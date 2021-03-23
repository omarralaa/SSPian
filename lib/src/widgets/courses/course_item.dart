import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:sspian/src/models/course.dart';
import 'package:sspian/src/utils/factory_utils.dart';
import 'package:sspian/src/utils/utils.dart';

class CourseItem extends StatelessWidget {
  final Course course;
  const CourseItem(this.course);


  @override
  Widget build(BuildContext context) {
  final FactoryUtils factoryUtils = FactoryUtils();
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(factoryUtils.getIconByDepartment(course.department), size: 40,),
        Text(course.name, style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
        Text('${course.code}', style: TextStyle(color: Colors.black38),),
        OutlinedButton(
          onPressed: () {},
          child: Text("View Course"),
        )
      ],),
    );
  }
}
