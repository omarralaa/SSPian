import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sspian/src/Widgets/upper_squares_home.dart';
import 'package:sspian/src/models/profile.dart';
import 'package:sspian/src/providers/auth.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Profile profile = Provider.of<Auth>(context).profile;
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
      body: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (overscroll) {
          overscroll.disallowGlow();
          return null;
        },
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(top: 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildAvatar(),
                Padding(
                  padding: const EdgeInsets.only(top: 12.0),
                  child: Text(
                    profile.firstName + " " + profile.lastName,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24.0,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    "id: " +
                        profile
                            .sspId + " - " + profile.department, 
                    style: TextStyle(
                      color: Colors.black26,
                      fontSize: 16.0,
                    ),
                  ),
                ),
                _buildSubscriptionsButton(),
                _buildEditProfileButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSubscriptionsButton() {
    return Padding(
      padding: const EdgeInsets.only(top: 40.0, left: 30.0, right: 30.0),
      child: OutlineButton(
        onPressed: () {},
        padding: const EdgeInsets.all(12.0),
        highlightedBorderColor: Colors.black87,
        borderSide: BorderSide(color: Colors.black87),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Subscriptions",),
            Icon(Icons.arrow_forward_ios,),
          ],
        ),
      ),
    );
  }

  Widget _buildEditProfileButton() {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0, left: 30.0, right: 30.0),
      child: OutlineButton(
          onPressed: () {},
          padding: const EdgeInsets.all(12.0),
          highlightedBorderColor: Colors.black87,
          borderSide: BorderSide(color: Colors.black87),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Edit Profile",),
              Icon(Icons.arrow_forward_ios,),
            ],
          ),
        ),
    );
  }

  Widget _buildAvatar() {
    return Container(
      height: 120.0,
      width: 120.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage('assets/images/avatar.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
