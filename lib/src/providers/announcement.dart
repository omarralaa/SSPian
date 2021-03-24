import 'package:flutter/foundation.dart';
import 'package:sspian/src/models/announcement.dart';
import 'package:sspian/src/services/api/announcement_service.dart';

class AnnouncementProvider with ChangeNotifier {
  List<Announcement> _announcements = [];

  List<Announcement> get announcements => _announcements;

  AnnouncementService _announcementService = AnnouncementService();

  Future<void> getAnnouncements() async {
    try {
      _announcements = await _announcementService.getAnnouncements({'sort': '-createdAt'});
      notifyListeners();
    } catch (err) {
      throw (err);
    }
  }
}
