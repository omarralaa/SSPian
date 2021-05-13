import 'package:sspian/src/models/deadline.dart';
import 'package:sspian/src/models/http_responses/upcomming_deadline_http_response.dart';

abstract class IDeadlineRepository {
  Future<List<Deadline>> getDeadlines(Map<String, dynamic> query);
  Future<UpcommingDeadlineHttpResponse> getUpcommingDeadlines();
}
