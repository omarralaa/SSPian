import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sspian/src/providers/announcement.dart';
import 'package:sspian/src/providers/deadline.dart';

import 'package:sspian/src/widgets/anounncements/announcements_list.dart';
import 'package:sspian/src/widgets/anounncements/anounncements_page_header.dart';
import 'package:sspian/src/widgets/anounncements/filter_card.dart';

class AnnouncementsScreen extends StatelessWidget {
  static const String routeName = '/announcements';

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
            AnnouncementsList(),
          ],
        ),
        FilterCard(),
      ],
    );
  }
}
