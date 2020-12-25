import 'package:sspian/src/models/auth_response.dart';
import 'package:sspian/src/models/http_exception.dart';

class AuthService {
  Future<AuthResponse> login(String email, String password) async {
    if (email == 'omar@gmail.com' && password == '123456') {
      return AuthResponse('TOKEN', '23194167');
    } else {
      throw HttpException('Invalid username or password');
    }
  }

  Future<AuthResponse> register(
      String fullName, String email, String password) async {
    return AuthResponse('TOKEN', '23194167');
  }
}
