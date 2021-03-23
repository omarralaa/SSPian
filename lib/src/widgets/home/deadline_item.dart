import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:random_color/random_color.dart';
import 'package:sspian/src/utils/utils.dart';

class DeadlineItem extends StatelessWidget {
  final deadline;

  DeadlineItem(this.deadline);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Utils.size.width * 0.6,
      margin: EdgeInsets.only(right: Utils.size.width * 0.05),
      padding: EdgeInsets.only(
        //top: Utils.size.height * 0.02,
        left: Utils.size.width * 0.04,
        right: Utils.size.width * 0.05,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xffc7ccd2)),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildHeader(),
          //SizedBox(height: Utils.size.height * 0.02),
          _buildTitle(),
          //SizedBox(height: Utils.size.height * 0.015),
          _buildType(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        _buildTimeLabel(),
        SizedBox(width: Utils.size.width * 0.05),
        _buildSubjectLabel(),
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
        SizedBox(width: Utils.size.width * 0.01),
        Text(
          DateFormat.jm().format(deadline['deadline']),
          style: TextStyle(
            fontSize: 13,
            color: Color(0xffa8b1b9),
          ),
        ),
      ],
    );
  }

  Widget _buildSubjectLabel() {
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
              deadline['courseName'],
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
      padding: EdgeInsets.only(left: Utils.size.width * 0.004),
      child: Text(
        deadline['title'],
        style: TextStyle(
          fontSize: 15,
          color: Color(0xff1d2631),
          //fontWeight: FontWeight.w600,
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
          radius: Utils.size.width * 0.01,
        ),
        SizedBox(width: Utils.size.width * 0.02),
        Text(
          deadline['type'].toString().toUpperCase(),
          style: TextStyle(
            color: Color(0xffa8b1b9),
            fontSize: 12
          ),
        ),
      ],
    );
  }
}
