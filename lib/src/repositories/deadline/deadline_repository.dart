import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:sspian/src/models/deadline.dart';
import 'package:sspian/src/models/http_exception.dart';
import 'package:sspian/src/repositories/deadline/deadline_repository_interface.dart';
import 'package:sspian/src/services/api/sspian_api_service.dart';

class DeadlineRepository extends IDeadlineRepository {
  Dio _httpClient;

  static const subUrl = '/deadlines';

  DeadlineRepository() {
    _httpClient = GetIt.I<SSPApiService>().httpClient;
  }

  @override
  Future<List<Deadline>> getDeadlines(Map<String, String> query) async {
    try {
      final response = await _httpClient.get(subUrl, queryParameters: query);

      final data = response.data['data'];
      List<Deadline> deadlines = [];

      for (var ac in data) {
        Deadline an = Deadline.fromJson(ac);
        deadlines.add(an);
      }

      return deadlines;
    } on DioError catch (err) {
      throw HttpException(err.response.data['error']);
    } catch (err) {
      throw (err);
    }
  }
}
