import 'package:flutter/material.dart';
import 'package:sspian/src/models/deadline.dart';
import 'package:sspian/src/models/deadline_type.dart';

class FactoryUtils {
  IconData getIconByDepartment(department) {
    switch (department) {
      case 'CCE':
        return Icons.computer_sharp;
      case 'CAE':
        return Icons.architecture;
      case 'EME':
        return Icons.electrical_services_outlined;
      default:
        return Icons.engineering;
    }
  }

  Color getAnnouncementColor(announcemnt) {
    if (announcemnt is Deadline) {
      switch (announcemnt.deadlineType) {
        case DeadLineType.assignment:
          return Color(0xffeb6778);
        case DeadLineType.project:
          return Color(0xff758ae2);
        case DeadLineType.quiz:
          return Color(0xfff9ce96);
      }
    }

    return Color(0xff53aae9);
  }

  String getAnnouncementType(announcemnt) {
    if (announcemnt is Deadline) {
      switch (announcemnt.deadlineType) {
        case DeadLineType.quiz:
          return 'Quiz';
        case DeadLineType.assignment:
          return 'assignment';
        case DeadLineType.project:
          return 'Project';
      }
    }

    return 'Update';
  }

  static DeadLineType getDeadlineType(String type) {
    switch (type) {
      case 'assignment':
        return DeadLineType.assignment;
      case 'quiz':
        return DeadLineType.quiz;
      case 'project':
        return DeadLineType.project;
      default:
        return DeadLineType.assignment;
    }
  }
}
