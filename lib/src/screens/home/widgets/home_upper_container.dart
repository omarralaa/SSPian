import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sspian/src/providers/update.dart';
import 'package:sspian/src/screens/home/widgets/deadline_item.dart';

import 'package:sspian/src/utils/constants.dart';

class HomeUpperContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xfff7f7f7),
      height: Constants.height * 0.32,
      width: double.infinity,
      padding: EdgeInsets.only(
        top: Constants.height * 0.075,
        left: Constants.width * 0.05,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTodayLabel(),
          SizedBox(height: Constants.height * 0.01),
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
    return Consumer<UpdateProvider>(builder: (context, update, _) {
      return Container(
        padding: EdgeInsets.only(top: Constants.height * 0.03),
        height: Constants.height * 0.16,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: update.upcommingDeadlines.length,
          itemBuilder: (ctx, i) {
            return DeadlineItem(update.upcommingDeadlines[i]);
          },
        ),
      );
    });
  }
}
