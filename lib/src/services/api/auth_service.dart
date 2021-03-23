import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:sspian/src/models/auth_response.dart';
import 'package:sspian/src/models/http_exception.dart';
import 'package:sspian/src/utils/service_utils.dart';

class AuthService with ServiceUtils {
  final url = ServiceUtils.baseUrl + '/auth';

  Future<AuthResponse> login(String email, String password) async {
    final loginUrl = url + '/login';
    final reqBody = json.encode({
      'email': email,
      'password': password,
    });

    final Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };

    try {
      final response = await http
          .post(Uri.parse(loginUrl), body: reqBody, headers: requestHeaders)
          .timeout(timeout,
              onTimeout: () => throw HttpException('Server Timed out'));

      final responseData = json.decode(response.body);

      if (responseData['error'] != null || responseData['success'] == false)
        throw HttpException(responseData['error']);

      final authResponse = AuthResponse.fromJson(responseData['data']);

      return authResponse;
    } catch (err) {
      throw (err);
    }
  }

  Future<AuthResponse> register(profile) async {
    final registerUrl = url + '/register';

    final Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };

    final reqBody = json.encode(profile);

    try {
      final response = await http
          .post(
            Uri.parse(registerUrl),
            body: reqBody,
            headers: requestHeaders,
          )
          .timeout(
            timeout,
            onTimeout: () => throw HttpException('Server Timed out'),
          );

      final responseData = json.decode(response.body);

      if (responseData['error'] != null) {
        throw HttpException(responseData['error']);
      }

      final authResponse = AuthResponse.fromJson(responseData['data']);
      return authResponse;
    } catch (err) {
      throw (err);
    }
  }
}
