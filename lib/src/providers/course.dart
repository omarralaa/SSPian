import 'package:flutter/foundation.dart';

import 'package:sspian/src/models/course.dart';
import 'package:sspian/src/repositories/course/course_repository.dart';
import 'package:sspian/src/repositories/course/course_repository_interface.dart';
import 'package:sspian/src/repositories/enrollment/enrollment_repository.dart';
import 'package:sspian/src/repositories/enrollment/enrollment_repository_interface.dart';

class CourseProvider with ChangeNotifier {
  List<Course> _courses = [];
  List<Course> _enrolledCourses = [];

  List<Course> get courses => _courses;
  List<Course> get enrolledCourses => _enrolledCourses;

  final ICourseRepository _courseRepository = CourseRepository();
  final IEnrollmentRepository _enrollmentRepository = EnrollmentRepository();

  void setCourses(List<Course> crs) {
    _courses = crs;
    notifyListeners();
  }

  void filterCoursesByTerm(String term) {}

  Future<void> getCourses(query) async {
    final map = Map<String, String>();
    try {
      final crs = await _courseRepository.getCourses(map);
      setCourses(crs);
    } catch (err) {
      print(err);
    }
  }

  Future<void> getEnrolledCourses() async {
    try {
      _enrolledCourses = await _enrollmentRepository.getEnrollments(true);
    } catch (err) {
      print(err);
    }
  }

  Course getEnrolledCourse(courseId) {
    return  _enrolledCourses.firstWhere((element) => element.id == courseId);
  }
}
