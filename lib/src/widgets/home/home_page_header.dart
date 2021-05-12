import 'package:flutter/material.dart';

import 'package:sspian/src/utils/constants.dart';

class HomePageHeader extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoledKey;

  HomePageHeader(this._scaffoledKey);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: Constants.height * 0.02),
      height: Constants.height * .15,
      width: double.infinity,
      color: Theme.of(context).primaryColor,
      child: Column(
        children: [
          _buildTitleRow(),
        ],
      ),
    );
  }

  Widget _buildTitleRow() {
    return Row(
      children: [
        IconButton(
          icon: Icon(
            Icons.menu,
            color: Colors.white,
          ),
          onPressed: () => _scaffoledKey.currentState.openDrawer(),
        ),
        SizedBox(width: Constants.width * 0.3),
        Text(
          'SSPIAN',
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
