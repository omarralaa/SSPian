import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sspian/src/Widgets/upper_squares_home.dart';
import 'package:sspian/src/providers/auth.dart';
import 'package:sspian/src/providers/profile.dart' as p;
import 'package:sspian/src/utils/constants.dart';
import 'package:sspian/src/widgets/profile/profile_button.dart';
import 'package:sspian/src/widgets/profile/profile_header.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              icon: Icon(Icons.logout, color: Colors.black),
              onPressed: () =>
                  Provider.of<Auth>(context, listen: false).logout(),
            ),
          ),
        ],
        elevation: 0,
        flexibleSpace: UpperSquaresHome(),
        backgroundColor: Colors.red.withOpacity(0),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.only(top: 8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ProfileHeader(),
              _buildButtonList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButtonList() {
    return Padding(
      padding: EdgeInsets.only(top: Constants.height * 0.02),
      child: Column(
        children: [
          ProfileButton(text: 'Subscriptions', callback: _subscriptions),
          ProfileButton(
            text: 'Edit Profile',
            callback: _editProfile,
          )
        ],
      ),
    );
  }

  void _subscriptions() {}

  void _editProfile() {}
}
