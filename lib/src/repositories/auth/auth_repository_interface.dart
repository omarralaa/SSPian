import 'package:sspian/src/models/auth_response.dart';

abstract class IAuthRepository {
  Future<AuthResponse> loginWithEmailAndPassword(String email, String password);
  Future<AuthResponse> register(profile);
}
