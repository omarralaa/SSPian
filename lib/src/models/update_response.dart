import 'package:sspian/src/models/announcement.dart';
import 'package:sspian/src/models/update.dart';

import 'deadline.dart';

class UpdateResponse {
  List<Update> updates;
  int totalDocuments;
  int currentPage = 1;
  int totalPages;

  UpdateResponse.fromJson(data, pagination) {
    totalDocuments = pagination['totalDocuments'];
    totalPages = pagination['totalPages'];
    currentPage = pagination['page'];

    updates = updatesFromJson(data);
  }

  List<Update> updatesFromJson(data) {
    List<Update> _announcements = [];
    for (var ac in data) {
      Update an;

      switch (ac['itemtype']) {
        case 'Announcement':
          an = Announcement.fromJson(ac);
          break;
        case 'Deadline':
          an = Deadline.fromJson(ac);
          break;
      }
      _announcements.add(an);
    }

    return _announcements;
  }
}
