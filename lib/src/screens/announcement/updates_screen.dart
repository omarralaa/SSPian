import 'package:flutter/material.dart';

import 'package:sspian/src/screens/announcement/widgets/updates_list.dart';
import 'package:sspian/src/screens/announcement/widgets/updates_page_header.dart';
import 'package:sspian/src/screens/announcement/widgets/filter_card.dart';

class UpdatesScreen extends StatefulWidget {
  static const String routeName = '/announcements';

  @override
  _UpdatesScreenState createState() => _UpdatesScreenState();
}

class _UpdatesScreenState extends State<UpdatesScreen> {
  int _selectedIndex = 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

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
            UpdatesList(index: _selectedIndex),
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
