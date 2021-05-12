import 'package:flutter/foundation.dart';
import 'package:sspian/src/models/announcement.dart';
import 'package:sspian/src/models/deadline.dart';
import 'package:sspian/src/models/deadline_type.dart';
import 'package:sspian/src/repositories/announcement/announcement_repository.dart';
import 'package:sspian/src/repositories/announcement/announcement_repository_interface.dart';
import 'package:sspian/src/repositories/deadline/deadline_repository.dart';
import 'package:sspian/src/repositories/deadline/deadline_repository_interface.dart';

class AnnouncementProvider with ChangeNotifier {
  List<Announcement> _announcements = [];
  List<Deadline> _deadlines = [];

  IAnnouncmentRepository _announcementRepository = AnnouncementRepository();
  IDeadlineRepository _deadlineRepository = DeadlineRepository();

  int page = 0;
  final int limit = 10;

  // Getters
  List<Announcement> get announcements => _announcements;
  List<Deadline> get deadlines => _deadlines;

  List<Deadline> get assignments {
    return _deadlines
        .where((element) => element.deadlineType == DeadLineType.assignment)
        .toList();
  }

  List<Deadline> get quizes {
    return _deadlines
        .where((element) => element.deadlineType == DeadLineType.quiz)
        .toList();
  }

  List<Deadline> get projects {
    return _deadlines
        .where((element) => element.deadlineType == DeadLineType.project)
        .toList();
  }

  List<Announcement> get allAnnoumcements {
    List<Announcement> all = [];

    int i = 0, j = 0;
    while (i < announcements.length && j < deadlines.length) {
      bool condition =
          announcements[i].dateCreated.isAfter(deadlines[j].dateCreated);

      if (condition) {
        all.add(announcements[i++]);
      } else {
        all.add(deadlines[j++]);
      }
    }

    while (i < announcements.length) all.add(announcements[i++]);
    while (j < deadlines.length) all.add(deadlines[j++]);

    return all;
  }

  List<Announcement> getSpecificAnnouncement(int index) {
    List<Announcement> announcements = [];
    switch (index) {
      case 0:
        return allAnnoumcements;
        break;
      case 1:
        return deadlines;
        break;
      case 2:
        return assignments;
        break;
      case 3:
        return projects;
        break;
      case 4:
        return quizes;
        break;
      case 5:
        return announcements;
        break;
    }
    notifyListeners();
  }

  Future<void> getAnnouncements() async {
    try {
      final announcementResponse = await _announcementRepository
          .getAnnouncements(
              {'sort': '-createdAt', 'limit': limit.toString(), 'page': '1'});

      _announcements = announcementResponse.announcements;
      page = announcementResponse.currentPage;

      notifyListeners();
    } catch (err) {
      throw (err);
    }
  }

  Future<void> getDeadlines() async {
    try {
      _deadlines = await _deadlineRepository.getDeadlines(
          {'sort': '-createdAt', 'limit': limit.toString(), 'page': '1'});
      notifyListeners();
    } catch (err) {
      throw (err);
    }
  }

  Future<List<Announcement>> pageFetch(int offset) async {
    //page = (offset / limit).round() + 1;
    page++;

    final nextAnnouncementsResponse = await _announcementRepository
        .getAnnouncements({
      'sort': '-createdAt',
      'limit': limit.toString(),
      'page': page.toString()
    });

    return page + 1 == nextAnnouncementsResponse.totalPages
        ? []
        : nextAnnouncementsResponse.announcements;
    //return nextAnnouncements;
  }
}
