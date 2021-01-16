import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:sspian/src/models/auth_response.dart';
import 'package:sspian/src/services/auth_service.dart';

class Auth with ChangeNotifier {
  String _token;

  String get token => _token;

  bool get isAuth => _token != null;

  final AuthService _authService = AuthService();
  final _flutterSecureStorage = FlutterSecureStorage();

  Future<void> login(String email, String password) async {
    final authResponse = await _authService.login(email, password);
    await _setData(authResponse);
  }

  Future<void> register(profile) async {
    final authResponse = await _authService.register(profile);
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
      print(_token);
      notifyListeners();
    }
  }

  Future<void> _setData(AuthResponse authResponse) async {
    _token = authResponse.token;
    var jsonAuth = json.encode({'token': _token});
    await _flutterSecureStorage.write(key: 'jsonAuth', value: jsonAuth);
    notifyListeners();
  }
}
