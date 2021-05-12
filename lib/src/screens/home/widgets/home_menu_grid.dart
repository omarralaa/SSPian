import 'package:flutter/material.dart';
import 'package:sspian/src/screens/announcement/announcements_screen.dart';
import 'package:sspian/src/screens/calendar_screen.dart';
import 'package:sspian/src/screens/home/widgets/menu_item.dart';
import 'package:sspian/src/utils/constants.dart';

class HomeMenuGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: Constants.width * 0.05),
        child: GridView.count(
          childAspectRatio: Constants.height / Constants.width * 0.6,
          crossAxisCount: 2,
          children: [
            MenuItem(
              title: 'Announcments',
              iconData: Icons.campaign,
              routeName: AnnouncementsScreen.routeName,
              color: Color(Constants.colorPaletteArray[0]),
            ),
            MenuItem(
              title: 'My Calendar',
              iconData: Icons.calendar_today,
              routeName: CalendarScreen.routeName,
              color: Color(Constants.colorPaletteArray[1]),
            ),
            MenuItem(
              title: 'My Calendar',
              iconData: Icons.calendar_today,
              routeName: CalendarScreen.routeName,
              color: Color(Constants.colorPaletteArray[2]),
            ),
            MenuItem(
              title: 'My Calendar',
              iconData: Icons.calendar_today,
              routeName: CalendarScreen.routeName,
              color: Color(Constants.colorPaletteArray[3]),
            ),
          ],
        ),
      ),
    );
  }
}
