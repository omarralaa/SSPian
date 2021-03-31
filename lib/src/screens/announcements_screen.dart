import 'package:flutter/material.dart';

import 'package:sspian/src/widgets/anounncements/announcements_list.dart';
import 'package:sspian/src/widgets/anounncements/anounncements_page_header.dart';
import 'package:sspian/src/widgets/anounncements/filter_card.dart';

class AnnouncementsScreen extends StatefulWidget {
  static const String routeName = '/announcements';

  @override
  _AnnouncementsScreenState createState() => _AnnouncementsScreenState();
}

class _AnnouncementsScreenState extends State<AnnouncementsScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Stack(
      children: [
        Column(
          children: [
            AnnouncementsPageHeader(),
            AnnouncementsList(index: _selectedIndex),
          ],
        ),
        FilterCard(_selectedIndex, selectIndex),
      ],
    );
  }

  selectIndex(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
