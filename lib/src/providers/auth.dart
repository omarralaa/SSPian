import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:sspian/src/models/AuthServiceModel.dart';

import 'package:sspian/src/models/auth_response.dart';
import 'package:sspian/src/models/profile.dart';
import 'package:sspian/src/repositories/auth/auth_repository.dart';
import 'package:sspian/src/repositories/auth/auth_repository_interface.dart';
import 'package:sspian/src/services/api/sspian_api_service.dart';

class Auth with ChangeNotifier {
  String _token;
  Profile _profile;

  String get token => _token;

  bool get isAuth => _token != null;

  Profile get profile => _profile;

  final IAuthRepository _authRepository = AuthRepository();
  final _flutterSecureStorage = FlutterSecureStorage();

  Future<void> login(String email, String password) async {
    final authResponse =
        await _authRepository.loginWithEmailAndPassword(email, password);
    _profile = authResponse.profile;
    await _setData(authResponse);
  }

  Future<void> register(profile) async {
    final authResponse = await _authRepository.register(profile);
    _profile = authResponse.profile;
    await _setData(authResponse);
  }

  Future<void> logout() async {
    _flutterSecureStorage.delete(key: 'jsonAuth');
    _token = null;
    notifyListeners();
  }

  Future<dynamic> tryAutoLogin() async {
    final jsonAuth = await _flutterSecureStorage.read(key: 'jsonAuth');
    if (jsonAuth != null) {
      final authData = json.decode(jsonAuth);
      _token = authData['token'];
      GetIt.I<AuthServiceModel>().setToken(_token);
      GetIt.I<SSPApiService>().setToken(_token);
      Profile profile = Profile.fromJson(authData['profile']);
      _profile = profile;
      notifyListeners();
    }
  }

  Future<void> _setData(AuthResponse authResponse) async {
    final jsonProfile = authResponse.profile.toJson();
    final jsonAuth =
        json.encode({'token': authResponse.token, 'profile': jsonProfile});
    GetIt.I<AuthServiceModel>().setToken(authResponse.token);
    GetIt.I<SSPApiService>().setToken(authResponse.token);

    await _flutterSecureStorage.write(key: 'jsonAuth', value: jsonAuth);
    notifyListeners();
  }
}
