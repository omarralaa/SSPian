import 'package:flutter/material.dart';
import 'package:sspian/src/screens/announcements_screen.dart';
import 'package:sspian/src/screens/calendar_screen.dart';
import 'package:sspian/src/utils/utils.dart';
import 'package:sspian/src/widgets/home/menu_item.dart';

class HomeMenuGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: Utils.size.width * 0.05),
        child: GridView.count(
          childAspectRatio: Utils.size.height / Utils.size.width * 0.6,
          crossAxisCount: 2,
          children: [
            MenuItem(
              title: 'Announcments',
              iconData: Icons.campaign,
              routeName: AnnouncementsScreen.routeName,
              color: Color(Utils.colorPaletteArray[0]),
            ),
            MenuItem(
              title: 'My Calendar',
              iconData: Icons.calendar_today,
              routeName: CalendarScreen.routeName,
              color: Color(Utils.colorPaletteArray[1]),
            ),
            MenuItem(
              title: 'My Calendar',
              iconData: Icons.calendar_today,
              routeName: CalendarScreen.routeName,
              color: Color(Utils.colorPaletteArray[2]),
            ),
            MenuItem(
              title: 'My Calendar',
              iconData: Icons.calendar_today,
              routeName: CalendarScreen.routeName,
              color: Color(Utils.colorPaletteArray[3]),
            ),
          ],
        ),
      ),
    );
  }
}
