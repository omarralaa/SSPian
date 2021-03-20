import 'package:flutter/foundation.dart';

import 'package:sspian/src/models/course.dart';
import 'package:sspian/src/services/api/course_service.dart';

class CourseProvider with ChangeNotifier {
  List<Course> _courses;

  List<Course> get courses => _courses;

  List<Course> _filteredList;

  final _courseService = CourseService();

  void setCourses(List<Course> crs) {
    _courses = crs;
    notifyListeners();
  }

  void filterCoursesByTerm(String term) {}

  Future<void> getCourses(query) async {
    final map = Map<String, String>();
    try {
      final crs = await _courseService.getCourses(map);
      setCourses(crs);
    } catch (err) {
      print(err);
    }
  }
}
