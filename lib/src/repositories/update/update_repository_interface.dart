import 'package:sspian/src/models/update_response.dart';

abstract class IUpdateRepository {
  Future<UpdateResponse> getUpdates(Map<String, dynamic> query);
}