import 'package:sspian/src/models/profile.dart';

class AuthResponse {
  final String _token;
  final Profile _profile;

  String get token => _token;
  Profile get profile => _profile;

  AuthResponse.fromJson(Map<String, dynamic> map)
      : _token = map['token'],
        _profile = Profile.fromJson(map['profile']);

  // Map<String, dynamic> toJson() => {
  //       'token': token,
  //       'userId': userId,
  //     };
}
