import 'package:sspian/src/models/AnounncementResponse.dart';

abstract class IAnnouncmentRepository {
  Future<AnnouncementResponse> getAnnouncements(Map<String, String> query);
}
