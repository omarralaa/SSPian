import 'package:sspian/src/models/announcement.dart';
import 'package:sspian/src/models/deadline_type.dart';
import 'package:sspian/src/models/update.dart';
import 'package:sspian/src/utils/factory_utils.dart';

class Deadline extends Update {
  final DateTime _dueDate;
  final DeadLineType _type;

  DateTime get dueDate => _dueDate;
  DeadLineType get deadlineType => _type;

  Deadline.fromJson(Map<String, dynamic> json)
      : _dueDate = DateTime.parse(json['dueDate']),
        _type = FactoryUtils.getDeadlineType(json['type']),
        super.fromJson(json);
}
