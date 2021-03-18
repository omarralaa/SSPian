import 'package:get_it/get_it.dart';
import 'package:sspian/src/models/AuthServiceModel.dart';

class ServiceUtils {
  static const String baseUrl = 'http://10.0.2.2:3000/api/v1';
  final Duration timeout = Duration(seconds: 5);

  String get token {
    return GetIt.I<AuthServiceModel>().token;
  }
}
