import 'package:flutter/foundation.dart';
import 'package:sspian/src/models/deadline.dart';
import 'package:sspian/src/services/api/deadline_service.dart';

class DeadlineProvider with ChangeNotifier {
  List<Deadline> _deadlines = [];

  List<Deadline> get deadlines => _deadlines;

  DeadlineService _deadlineService = DeadlineService();

  Future<void> getDeadlines() async {
    try {
      _deadlines = await _deadlineService.getDeadlines({'sort': '-createdAt'});
      notifyListeners();
    } catch (err) {
      throw (err);
    }
  }
}