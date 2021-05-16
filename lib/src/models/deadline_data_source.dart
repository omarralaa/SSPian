import 'dart:ui';

import 'package:sspian/src/utils/constants.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import 'course.dart';
import 'deadline.dart';

class DeadlinesDataSource extends CalendarDataSource {
  Course Function(dynamic) getEnrolledCourse;

  int colorIndex = 0;

  DeadlinesDataSource(List<Deadline> deadlines, Function getEnrolledCourse) {
    this.getEnrolledCourse = getEnrolledCourse;
    appointments = deadlines;
  }

  @override
  DateTime getStartTime(int index) {
    return appointments[index].dueDate;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments[index].dueDate;
  }

  @override
  String getSubject(int index) {
    String courseName = getEnrolledCourse(appointments[index].courseId).name;
    final text = '${appointments[index].title}\n$courseName';
    return text;
  }

  @override
  Color getColor(int index) {
    final index = colorIndex % (Constants.colorPaletteArray.length - 1);
    final _colorHex = Constants.colorPaletteArray[index];

    colorIndex++;

    final _color = Color(_colorHex);
    return _color;
  }

  @override
  bool isAllDay(int index) {
    return true;
  }
}
