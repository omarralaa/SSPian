import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:sspian/src/models/announcement.dart';
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
  Future<List<Announcement>> getAnnouncements(Map<String, String> query) async {
    try {
      final response = await _httpClient.get(
        subUrl,
        queryParameters: query,
      );

      final data = response.data['data'];

      List<Announcement> announcements = [];

      for (var ac in data) {
        Announcement an = Announcement.fromJson(ac);
        announcements.add(an);
      }

      return announcements;
    } on DioError catch (err) {
      throw HttpException(err.response.data);
    } catch (err) {
      throw (err);
    }
  }
}
