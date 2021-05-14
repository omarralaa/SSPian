import 'package:sspian/src/models/announcement.dart';
import 'package:sspian/src/models/update_response.dart';

abstract class IAnnouncmentRepository {
  Future<List<Announcement>> getAnnouncements(Map<String, String> query);
}
