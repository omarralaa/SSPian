import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sspian/src/providers/announcement.dart';
import 'package:sspian/src/providers/deadline.dart';
import 'package:sspian/src/utils/utils.dart';

import 'announcement_item.dart';

class AnnouncementsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final announcemnts =
        Provider.of<AnnouncementProvider>(context).announcements;

    final deadlines = Provider.of<DeadlineProvider>(context).deadlines;
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: Utils.size.width * 0.05),
        child: ListView.builder(
          itemCount: deadlines.length,
          itemBuilder: (ctx, index) {
            return AnnouncementItem(deadlines[index]);
          },
        ),
      ),
    );
  }
}
