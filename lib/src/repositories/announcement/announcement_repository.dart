import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:sspian/src/models/AnounncementResponse.dart';
import 'package:sspian/src/models/http_exception.dart';
import 'package:sspian/src/repositories/announcement/announcement_repository_interface.dart';
import 'package:sspian/src/services/api/sspian_api_service.dart';

class AnnouncementRepository extends IAnnouncmentRepository {
  Dio _httpClient;

  static const subUrl = '/announcements';

  AnnouncementRepository() {
    _httpClient = GetIt.I<SSPApiService>().httpClient;
  }

  @override
  Future<AnnouncementResponse> getAnnouncements(
      Map<String, String> query) async {
    try {
      final response = await _httpClient.get(
        subUrl,
        queryParameters: query,
      );

      AnnouncementResponse announcementResponse = AnnouncementResponse.fromJson(
          response.data['data'], response.data['pagination']);

      return announcementResponse;
    } on DioError catch (err) {
      throw HttpException(err.response.data);
    } catch (err) {
      throw (err);
    }
  }
}
