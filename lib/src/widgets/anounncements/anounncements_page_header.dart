import 'package:flutter/material.dart';

import 'package:sspian/src/utils/utils.dart';

class AnnouncementsPageHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: Utils.size.height * 0.02),
      height: Utils.size.height * .15,
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
        SizedBox(width: Utils.size.width * 0.24),
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
