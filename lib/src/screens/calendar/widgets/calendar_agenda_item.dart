import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sspian/src/models/deadline.dart';
import 'package:sspian/src/providers/course.dart';
import 'package:sspian/src/utils/constants.dart';
import 'package:sspian/src/utils/factory_utils.dart';

class CalendarAgendaItem extends StatelessWidget {
  final Deadline deadline;
  final Color color;

  final _utils = FactoryUtils();

  CalendarAgendaItem(this.deadline, this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: Constants.height * 0.005),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Constants.width * 0.01),
        color: color,
      ),
      child: ListTile(
        title: Text(
          deadline.title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: Text(
          getCourseName(deadline.courseId, context),
          style: TextStyle(
            color: Colors.white,
            fontSize: Constants.height * 0.016,
          ),
        ),
        trailing: _buildTrailing(),
      ),
    );
  }

  Widget _buildTrailing() {
    return Container(
      width: Constants.width * 0.2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            _utils.getIconByDeadlineType(deadline.deadlineType),
            color: Colors.white,
          ),
          SizedBox(
            height: Constants.height * 0.001,
          ),
          Text(
            _utils.getAnnouncementType(deadline),
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }

  String getCourseName(String courseId, context) {
    return Provider.of<CourseProvider>(context, listen: false)
        .getEnrolledCourse(courseId)
        .name;
  }
}
