import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:random_color/random_color.dart';
import 'package:sspian/src/models/deadline.dart';
import 'package:sspian/src/providers/course.dart';
import 'package:sspian/src/utils/constants.dart';

class DeadlineItem extends StatelessWidget {
  final Deadline deadline;

  DeadlineItem(this.deadline);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Constants.width * 0.6,
      margin: EdgeInsets.only(right: Constants.width * 0.05),
      padding: EdgeInsets.only(
        left: Constants.width * 0.04,
        right: Constants.width * 0.05,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xffc7ccd2)),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildHeader(context),
          _buildTitle(),
          _buildType(),
        ],
      ),
    );
  }

  Widget _buildHeader(context) {
    return Row(
      children: [
        _buildTimeLabel(),
        SizedBox(width: Constants.width * 0.05),
        _buildSubjectLabel(context),
      ],
    );
  }

  Widget _buildTimeLabel() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.access_time,
          size: 14,
          color: Color(0xffa8b1b9),
        ),
        SizedBox(width: Constants.width * 0.01),
        Text(
          DateFormat.jm().format(deadline.dueDate),
          style: TextStyle(
            fontSize: 13,
            color: Color(0xffa8b1b9),
          ),
        ),
      ],
    );
  }

  Widget _buildSubjectLabel(context) {
    final course = Provider.of<CourseProvider>(context)
        .getEnrolledCourse(deadline.courseId);

    final courseName = course == null ? '' : course.name;
    return Expanded(
      child: Row(
        children: [
          Icon(
            Icons.subject,
            size: 14,
            color: Color(0xffa8b1b9),
          ),
          Expanded(
            child: Text(
              courseName,
              maxLines: 1,
              overflow: TextOverflow.fade,
              softWrap: false,
              style: TextStyle(
                fontSize: 13,
                color: Color(0xffa8b1b9),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTitle() {
    return Padding(
      padding: EdgeInsets.only(left: Constants.width * 0.004),
      child: Text(
        deadline.title,
        style: TextStyle(
          fontSize: 15,
          color: Color(0xff1d2631),
        ),
      ),
    );
  }

  Widget _buildType() {
    final _randomColor = RandomColor();

    Color _color = _randomColor.randomColor(
      colorBrightness: ColorBrightness.light,
    );

    return Row(
      children: [
        CircleAvatar(
          backgroundColor: _color,
          radius: Constants.width * 0.01,
        ),
        SizedBox(width: Constants.width * 0.02),
        Text(
          deadline.deadlineType.toString().split('.').last.toUpperCase(),
          style: TextStyle(color: Color(0xffa8b1b9), fontSize: 12),
        ),
      ],
    );
  }
}
