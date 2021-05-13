import 'package:sspian/src/models/course.dart';

abstract class ICourseRepository {
  Future<List<Course>> getCourses(Map<String, String> query);
  //Future<List<Course>> getEnrolledCourses();
}
