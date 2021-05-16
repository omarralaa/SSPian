import 'package:flutter/material.dart';
import 'package:sspian/src/models/deadline.dart';
import 'package:sspian/src/screens/calendar/widgets/calendar_agenda_item.dart';
import 'package:sspian/src/screens/calendar/widgets/today_date.dart';
import 'package:sspian/src/utils/constants.dart';

class CalendarAgenda extends StatelessWidget {
  final List<Deadline> appointments;
  final DateTime selectedDate;

  const CalendarAgenda(this.appointments, this.selectedDate);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: Constants.height * 0.02),
      child: Row(
        children: [
          TodayDate(selectedDate),
          Expanded(
            child: appointments.length == 0
                ? _buildNoDeadlinesContainer()
                : _buildList(),
          ),
        ],
      ),
    );
  }

  Widget _buildList() {
    return ListView.builder(
      itemCount: appointments.length,
      itemBuilder: (ctx, index) {
        final i = index % (Constants.colorPaletteArray.length - 1);
        final color = Color(Constants.colorPaletteArray[i]);
        return CalendarAgendaItem(appointments[index], color);
      },
    );
  }

  Widget _buildNoDeadlinesContainer() {
    return Container(
      padding: EdgeInsets.only(top: Constants.height * 0.04),
      alignment: Alignment.topCenter,
      child: Text(
        'There is no deadlines for that day',
        style: TextStyle(
          color: Colors.grey,
        ),
      ),
    );
  }
}
