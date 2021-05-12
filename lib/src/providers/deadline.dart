import 'package:flutter/foundation.dart';
import 'package:sspian/src/models/deadline.dart';
import 'package:sspian/src/models/deadline_type.dart';
import 'package:sspian/src/repositories/deadline/deadline_repository.dart';
import 'package:sspian/src/repositories/deadline/deadline_repository_interface.dart';

class DeadlineProvider with ChangeNotifier {
  List<Deadline> _deadlines = [];


  IDeadlineRepository _deadlineRepository = DeadlineRepository();

  Future<void> getDeadlines() async {
    try {
      _deadlines = await _deadlineRepository.getDeadlines({'sort': '-createdAt'});
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
