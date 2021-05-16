import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sspian/src/models/deadline_data_source.dart';
import 'package:sspian/src/providers/course.dart';
import 'package:sspian/src/providers/update.dart';
import 'package:sspian/src/utils/constants.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CalendarScreen extends StatelessWidget {
  static const String routeName = '/calendar';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Deadlines Calendar'),),
      backgroundColor: Colors.white,
      body: _buildBody(context),
    );
  }

  Widget _buildBody(context) {
    final upcommingDeadlines =
        Provider.of<UpdateProvider>(context).upcommingDeadlines;

    final getEnrolledCourse =
        Provider.of<CourseProvider>(context, listen: false).getEnrolledCourse;

    return Container(
      padding: EdgeInsets.only(
        left: Constants.width * 0.03,
        right: Constants.width * 0.03,
        top: Constants.height * 0.02,
      ),
      child: SfCalendar(
        todayHighlightColor: Theme.of(context).primaryColor,
        view: CalendarView.month,
        dataSource: DeadlinesDataSource(upcommingDeadlines, getEnrolledCourse),
        monthViewSettings: MonthViewSettings(
          agendaStyle: AgendaStyle(
            appointmentTextStyle: TextStyle(
              fontSize: Constants.width * 0.03,
            ),
          ),
          showAgenda: true,
          appointmentDisplayCount: 3,
          appointmentDisplayMode: MonthAppointmentDisplayMode.appointment,
          agendaItemHeight: Constants.height * 0.072,
          showTrailingAndLeadingDates: true,
        ),
      ),
    );
  }
}
