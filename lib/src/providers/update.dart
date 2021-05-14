import 'package:flutter/foundation.dart';
import 'package:sspian/src/models/announcement.dart';
import 'package:sspian/src/models/deadline.dart';
import 'package:sspian/src/models/deadline_type.dart';
import 'package:sspian/src/models/update.dart';
import 'package:sspian/src/repositories/announcement/announcement_repository.dart';
import 'package:sspian/src/repositories/announcement/announcement_repository_interface.dart';
import 'package:sspian/src/repositories/deadline/deadline_repository.dart';
import 'package:sspian/src/repositories/deadline/deadline_repository_interface.dart';
import 'package:sspian/src/repositories/update/update_repository.dart';
import 'package:sspian/src/repositories/update/update_repository_interface.dart';

class UpdateProvider with ChangeNotifier {
  List<Update> _updates = [];
  List<Announcement> _announcements = [];
  List<Deadline> _deadlines = [];
  List<Deadline> _upcommingDeadlines = [];

  IAnnouncmentRepository _announcementRepository = AnnouncementRepository();
  IDeadlineRepository _deadlineRepository = DeadlineRepository();
  IUpdateRepository _updateRepository = UpdateRepository();

  int page = 0;
  final int limit = 10;

  var upcommingDeadlinesCount = {
    'total': 0,
    'quiz': 0,
    'assignment': 0,
    'project': 0,
  };

  // Getters
  List<Announcement> get announcements => _announcements;
  List<Deadline> get deadlines => _deadlines;
  List<Deadline> get upcommingDeadlines => _upcommingDeadlines;
  List<Update> get updates => _updates;

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

  List<Update> getSpecificDeadline(int index) {
    switch (index) {
      case 0:
        return updates;
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

  Future<void> getUpdates() async {
    try {
      final updateResponse = await _updateRepository.getUpdates(
        {'sort': '-createdAt', 'limit': limit.toString(), 'page': '1'},
      );

      _updates = updateResponse.updates;
      page = updateResponse.currentPage;

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

  Future<void> getAnnouncements() async {
    try {
      _announcements = await _announcementRepository.getAnnouncements(
          {'sort': '-createdAt', 'limit': limit.toString(), 'page': '1'});

      notifyListeners();
    } catch (err) {
      throw (err);
    }
  }

  Future<void> getRecentUpcommingDeadlines() async {
    try {
      final httpResponse = await _deadlineRepository.getUpcommingDeadlines();
      _upcommingDeadlines = httpResponse.deadlines;
      upcommingDeadlinesCount['total'] = httpResponse.total;
      upcommingDeadlinesCount['quiz'] = httpResponse.quiz;
      upcommingDeadlinesCount['project'] = httpResponse.project;
      upcommingDeadlinesCount['assignment'] = httpResponse.assignment;
      notifyListeners();
    } catch (err) {
      throw (err);
    }
  }

  Future<List<Update>> pageFetch(int offset) async {
    //page = (offset / limit).round() + 1;
    page++;

    final nextUpdatesResponse = await _updateRepository.getUpdates({
      'sort': '-createdAt',
      'limit': limit.toString(),
      'page': page.toString()
    });

    return page + 1 == nextUpdatesResponse.totalPages
        ? []
        : nextUpdatesResponse.updates;
    //return nextAnnouncements;
  }
}
