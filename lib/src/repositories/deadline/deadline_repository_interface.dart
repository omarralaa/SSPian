import 'package:sspian/src/models/deadline.dart';

abstract class IDeadlineRepository {
  Future<List<Deadline>> getDeadlines(Map<String, String> query);
}
