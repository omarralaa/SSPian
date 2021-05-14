import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:sspian/src/models/update_response.dart';
import 'package:sspian/src/models/http_exception.dart';
import 'package:sspian/src/models/update.dart';
import 'package:sspian/src/repositories/update/update_repository_interface.dart';
import 'package:sspian/src/services/api/sspian_api_service.dart';

class UpdateRepository extends IUpdateRepository {
  Dio _httpClient;

  static const subUrl = '/updates';

  UpdateRepository() {
    _httpClient = GetIt.I<SSPApiService>().httpClient;
  }

  @override
  Future<UpdateResponse> getUpdates(Map<String, dynamic> query) async {
    try {
      final response = await _httpClient.get(
        subUrl,
        queryParameters: query,
      );

      UpdateResponse _updateResponse = UpdateResponse.fromJson(
          response.data['data'], response.data['pagination']);

      return _updateResponse;
    } on DioError catch (err) {
      throw HttpException(err.response.data);
    } catch (err) {
      throw (err);
    }
  }
}
