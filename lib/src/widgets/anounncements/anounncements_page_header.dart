import 'package:flutter/material.dart';

import 'package:sspian/src/utils/constants.dart';

class AnnouncementsPageHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: Constants.height * 0.02),
      height: Constants.height * .12,
      width: double.infinity,
      color: Theme.of(context).accentColor,
      child: Column(
        children: [
          _buildTitleRow(context),
        ],
      ),
    );
  }

  Widget _buildTitleRow(context) {
    return Row(
      children: [
        IconButton(
          icon: Icon(
            Icons.keyboard_backspace_rounded,
            color: Colors.white,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        SizedBox(width: Constants.width * 0.24),
        Text(
          'Announcements',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}
