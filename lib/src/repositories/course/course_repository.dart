import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:sspian/src/models/course.dart';
import 'package:sspian/src/models/http_exception.dart';
import 'package:sspian/src/repositories/course/course_repository_interface.dart';
import 'package:sspian/src/services/api/sspian_api_service.dart';

class CourseRepository extends ICourseRepository {
  Dio _httpClient;

  static const subUrl = '/courses';

  CourseRepository() {
    _httpClient = GetIt.I<SSPApiService>().httpClient;
  }

  @override
  Future<List<Course>> getCourses(Map<String, String> query) async {
    try {
      final response = await _httpClient.get(subUrl, queryParameters: query);

      final data = response.data['data'];
      List<Course> courses = [];

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

  // @override
  // Future<List<Course>> getEnrolledCourses() async {
  //   try {
  //     final response = await _httpClient.get(subUrl + '/enrolledrof', queryParameters: query);

  //     final data = response.data['data'];
  //     List<Course> courses = [];

  //     for (var c in data) {
  //       Course course = Course.fromJson(c);
  //       courses.add(course);
  //     }

  //     //return compute();
  //     return courses;
  //   } catch (err) {
  //     throw (err);
  //   }
  // }
}
