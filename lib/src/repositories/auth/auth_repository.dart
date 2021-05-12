import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:sspian/src/models/auth_response.dart';
import 'package:sspian/src/models/http_exception.dart';
import 'package:sspian/src/repositories/auth/auth_repository_interface.dart';
import 'package:sspian/src/services/api/sspian_api_service.dart';

class AuthRepository extends IAuthRepository {
  Dio _httpClient;

  static const subUrl = '/auth';

  AuthRepository() {
    _httpClient = GetIt.I<SSPApiService>().httpClient;
  }

  @override
  Future<AuthResponse> loginWithEmailAndPassword(
      String email, String password) async {
    final reqBody = json.encode({
      'email': email,
      'password': password,
    });

    try {
      final response = await _httpClient.post(
        subUrl + '/login',
        data: reqBody,
      );

      // final responseData = json.decode(response.body);

      final responseData = response.data;

      final authResponse = AuthResponse.fromJson(responseData['data']);

      return authResponse;
    } on DioError catch (err) {
      throw HttpException(err.response.data['error']);
    } catch (err) {
      throw (err);
    }
  }

  @override
  Future<AuthResponse> register(profile) async {
    final reqBody = json.encode(profile);

    try {
      final response = await _httpClient.post(
        subUrl + '/register',
        data: reqBody,
      );

      final authResponse = AuthResponse.fromJson(response.data['data']);
      return authResponse;
    } on DioError catch (err) {
      throw HttpException(err.response.data['error']);
    } catch (err) {
      throw (err);
    }
  }
}
