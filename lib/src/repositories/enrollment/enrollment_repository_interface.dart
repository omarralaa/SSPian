import 'package:sspian/src/models/course.dart';

abstract class IEnrollmentRepository {
  Future<List<Course>> getEnrollments(bool populate);
}
