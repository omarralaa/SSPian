import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:sspian/src/models/course.dart';
import 'package:sspian/src/repositories/enrollment/enrollment_repository_interface.dart';
import 'package:sspian/src/services/api/sspian_api_service.dart';

class EnrollmentRepository extends IEnrollmentRepository {
  Dio _httpClient;

  static const subUrl = '/profiles/enrollments';

  EnrollmentRepository() {
    _httpClient = GetIt.I<SSPApiService>().httpClient;
  }

  @override
  Future<List<Course>> getEnrollments(bool populate) async {
    try {
      final response = await _httpClient
          .get(subUrl, queryParameters: {'populate': populate});

      final data = response.data['data'];
      List<Course> courses = [];

      for (var c in data['enrollments']) {
        Course course = Course.fromJson(c);
        courses.add(course);
      }

      return courses;
    } catch (err) {
      throw (err);
    }
  }
}
