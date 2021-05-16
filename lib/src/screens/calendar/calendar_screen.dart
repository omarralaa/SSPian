import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sspian/src/models/deadline.dart';
import 'package:sspian/src/models/deadline_data_source.dart';
import 'package:sspian/src/providers/course.dart';
import 'package:sspian/src/providers/update.dart';
import 'package:sspian/src/screens/calendar/widgets/calendar_agenda.dart';
import 'package:sspian/src/utils/constants.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CalendarScreen extends StatefulWidget {
  static const String routeName = '/calendar';

  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  List<Deadline> _appointments = <Deadline>[];
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Deadlines Calendar'),
      ),
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
        bottom: Constants.height * 0.02,
      ),
      child: Column(
        children: [
          Container(
            height: Constants.height * 0.58,
            child: SfCalendar(
              showNavigationArrow: true,
              todayHighlightColor: Theme.of(context).primaryColor,
              view: CalendarView.month,
              dataSource:
                  DeadlinesDataSource(upcommingDeadlines, getEnrolledCourse),
              onTap: calendarTap,
              monthViewSettings: MonthViewSettings(
                appointmentDisplayCount: 3,
                appointmentDisplayMode: MonthAppointmentDisplayMode.appointment,
                showTrailingAndLeadingDates: true,
              ),
            ),
          ),
          Expanded(child: CalendarAgenda(_appointments, _selectedDate)),
        ],
      ),
    );
  }

  void calendarTap(CalendarTapDetails details) {
    if (details.targetElement == CalendarElement.calendarCell) {
      setState(() {
        _appointments = details.appointments.cast<Deadline>();
        _selectedDate = details.date;
      });
    }
  }
}
