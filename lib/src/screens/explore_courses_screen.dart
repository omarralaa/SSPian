import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sspian/src/Widgets/courses/add_course.dart';
import 'package:sspian/src/Widgets/courses/course_item.dart';

import 'package:sspian/src/Widgets/upper_squares_home.dart';
import 'package:sspian/src/providers/course.dart';
import 'package:sspian/src/providers/profile.dart';

class ExploreCourses extends StatefulWidget {
  @override
  _ExploreCoursesScreenState createState() => _ExploreCoursesScreenState();
}

class _ExploreCoursesScreenState extends State<ExploreCourses> {
  bool _isFirstLoaded = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (!_isFirstLoaded) {
      Provider.of<CourseProvider>(context, listen: false).getCourses({});
      _isFirstLoaded = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(top: 20.0, left: 15.0),
          child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back_ios)),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              icon: Icon(Icons.search_rounded, color: Colors.black),
              onPressed: () {},
            ),
          ),
        ],
        elevation: 0,
        flexibleSpace: UpperSquaresHome(),
        backgroundColor: Colors.red.withOpacity(0),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    final courses = Provider.of<CourseProvider>(context).courses;
    return courses == null
        ? Center(
            child: CircularProgressIndicator(
            backgroundColor: Theme.of(context).primaryColor,
          ))
        : GridView.builder(
            itemCount: courses.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemBuilder: (ctx, i) {
              return CourseItem(courses[i]);
            },
          );
  }
}
