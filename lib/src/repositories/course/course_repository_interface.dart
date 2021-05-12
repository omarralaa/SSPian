import 'package:sspian/src/models/course.dart';

abstract class ICourseRepository {
  Future<List<Course>> getCourses(Map<String, String> query);
}
