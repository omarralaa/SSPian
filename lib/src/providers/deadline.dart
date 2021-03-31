import 'package:flutter/foundation.dart';
import 'package:sspian/src/models/deadline.dart';
import 'package:sspian/src/models/deadline_type.dart';
import 'package:sspian/src/services/api/deadline_service.dart';

class DeadlineProvider with ChangeNotifier {
  List<Deadline> _deadlines = [];


  DeadlineService _deadlineService = DeadlineService();

  Future<void> getDeadlines() async {
    try {
      _deadlines = await _deadlineService.getDeadlines({'sort': '-createdAt'});
      notifyListeners();
    } catch (err) {
      throw (err);
    }
  }

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
}
