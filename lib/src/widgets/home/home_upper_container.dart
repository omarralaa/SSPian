import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:sspian/src/utils/utils.dart';
import 'package:sspian/src/widgets/home/deadline_item.dart';

class HomeUpperContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xfff7f7f7),
      height: Utils.size.height * 0.32,
      width: double.infinity,
      padding: EdgeInsets.only(
        top: Utils.size.height * 0.075,
        left: Utils.size.width * 0.05,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTodayLabel(),
          SizedBox(height: Utils.size.height * 0.01),
          _buildDateLabel(context),
          _buildDeadlinesList(),
        ],
      ),
    );
  }

  Widget _buildTodayLabel() {
    return Text(
      'Today\'s Timeline'.toUpperCase(),
      style: TextStyle(
        color: Color(0xffa3acb5),
        fontWeight: FontWeight.w100,
        fontSize: 12,
      ),
    );
  }

  Widget _buildDateLabel(context) {
    final date = DateFormat('EEE, MMM dd, yyyy').format(DateTime.now());

    return Text(
      date,
      style: TextStyle(
        color: Theme.of(context).accentColor,
        fontSize: 15,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildDeadlinesList() {
    final dummy_deadlines = [
      {
        'id': 1,
        'title': 'Sheet #5',
        'deadline': DateTime.now(),
        'courseName': 'Discrete Mathematics',
        'type': 'Assignment'
      },
      {
        'id': 2,
        'title': 'Quiz #1',
        'deadline': DateTime.now(),
        'courseName': 'Discrete Mathematics',
        'type': 'Quiz'
      },
      {
        'id': 3,
        'title': 'Project #2',
        'deadline': DateTime.now(),
        'courseName': 'Discrete Mathematics',
        'type': 'Project'
      },
    ];

    return dummy_deadlines == null
        ? SizedBox()
        : Container(
            padding: EdgeInsets.only(top: Utils.size.height * 0.03),
            height: Utils.size.height * 0.16,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 2,
              itemBuilder: (ctx, i) {
                return DeadlineItem(dummy_deadlines[i]);
              },
            ),
          );
  }
}
