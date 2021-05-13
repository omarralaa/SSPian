import 'package:sspian/src/models/update.dart';

abstract class IUpdateRepository {
  Future<List<Update>> getUpdates(Map<String, dynamic> query);
}