import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:sspian/src/models/auth_response.dart';
import 'package:sspian/src/models/profile.dart';
import 'package:sspian/src/services/auth_service.dart';

class Auth with ChangeNotifier {
  String _token;
  Profile _profile;

  String get token => _token;

  bool get isAuth => _token != null;

  Profile get profile => _profile;

  final AuthService _authService = AuthService();
  final _flutterSecureStorage = FlutterSecureStorage();

  Future<void> login(String email, String password) async {
    final authResponse = await _authService.login(email, password);
    _profile = authResponse.profile;
    await _setData(authResponse);
  }

  Future<void> register(profile) async {
    final authResponse = await _authService.register(profile);
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
      Profile profile = Profile.fromJson(authData['profile']);
      _profile = profile;
      notifyListeners();
    }
  }

  Future<void> _setData(AuthResponse authResponse) async {
    final jsonProfile = authResponse.profile.toJson();
    final jsonAuth = json.encode({
      'token': authResponse.token,
      'profile': jsonProfile
    });
    await _flutterSecureStorage.write(key: 'jsonAuth', value: jsonAuth);
    notifyListeners();
  }
}
