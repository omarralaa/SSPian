import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sspian/src/Widgets/upper_squares_home.dart';
import 'package:sspian/src/providers/course.dart';
import 'package:sspian/src/providers/profile.dart';
import 'package:sspian/src/widgets/courses/course_item.dart';

class CoursesScreen extends StatefulWidget {
  @override
  _CoursesScreenState createState() => _CoursesScreenState();
}

class _CoursesScreenState extends State<CoursesScreen> {
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
              onTap: () {},
              child: Text(
                "Select",
                style: TextStyle(color: Colors.black),
              )),
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
    final enrolledCourseIds =
        Provider.of<ProfileProvider>(context).profile.enrolledCourses;
    return courses == null
        ? Center(
            child: CircularProgressIndicator(
            backgroundColor: Theme.of(context).primaryColor,
          ))
        : ListView.builder(
            itemCount: courses.length,
            itemBuilder: (ctx, i) {
              return CourseItem(courses[i], enrolledCourseIds);
            },
            
          );
  }
}
