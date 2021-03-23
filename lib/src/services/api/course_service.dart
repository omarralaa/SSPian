import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:sspian/src/models/course.dart';
import 'package:sspian/src/models/http_exception.dart';
import 'package:sspian/src/utils/service_utils.dart';

class CourseService with ServiceUtils {
  final url = ServiceUtils.baseUrl + '/courses';

  Future<List<Course>> getCourses(Map<String, String> query) async {
    final Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'x-auth-token': token,
    };

    String queryString = Uri(queryParameters: query).query;
    final uri = Uri.parse(url + '?' + queryString);

    try {
      final response = await http.get(uri, headers: requestHeaders, ).timeout(
          timeout,
          onTimeout: () => throw HttpException('Server Timed out'));

      final responseData = json.decode(response.body);
      

      if (responseData['error'] != null || responseData['success'] == false)
        throw HttpException(responseData['error']);

      final data = responseData['data'];
      List<Course> courses = List<Course>();

      for (var c in data) {
        Course course = Course.fromJson(c);
        courses.add(course);
      }

      //return compute();
      return courses;
    } catch (err) {
      throw (err);
    }
  }
}
