import 'package:sspian/src/models/announcement.dart';

class AnnouncementResponse {
  List<Announcement> announcements;
  int totalDocuments;
  int currentPage = 1;
  int totalPages;

  AnnouncementResponse.fromJson(data, pagination) {
    totalDocuments = pagination['totalDocuments'];
    totalPages = pagination['totalPages'];
    currentPage = pagination['page'];

    announcements = announcementsFromJson(data);
  }

  List<Announcement> announcementsFromJson(data) {
    List<Announcement> _announcements = [];
    for (var ac in data) {
      Announcement an = Announcement.fromJson(ac);
      _announcements.add(an);
    }

    return _announcements;
  }
}
