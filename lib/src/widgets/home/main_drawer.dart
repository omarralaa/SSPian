import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sspian/src/providers/profile.dart';
import 'package:sspian/src/screens/courses_screen.dart';
import 'package:sspian/src/utils/general_utils.dart';
import 'package:sspian/src/utils/utils.dart';

class MainDrawer extends StatelessWidget {
  final GeneralUtils generalUtils = GeneralUtils();

  @override
  Widget build(BuildContext context) {
    final profile = Provider.of<ProfileProvider>(context).profile;
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: Utils.size.width * 0.1,
                  backgroundImage: NetworkImage(profile.photoUrl),
                  backgroundColor: Colors.transparent,
                ),
                SizedBox(
                  height: Utils.size.height * 0.02,
                ),
                Text(
                  'Good ${generalUtils.getPeriodOfDay()}, ${profile.firstName}',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            decoration: BoxDecoration(
                //color: Theme.of(context).primaryColor,
                ),
          ),
          ListTile(
            title: Text('My Courses'),
            onTap: () {
              Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => CoursesScreen()),
  );
            },
          ),
          ListTile(
            title: Text('About'),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
        ],
      ),
    );
  }
}
