import 'package:flutter/material.dart';
import 'package:pagination_view/pagination_view.dart';
import 'package:provider/provider.dart';
import 'package:sspian/src/models/announcement.dart';
import 'package:sspian/src/models/update.dart';
import 'package:sspian/src/providers/update.dart';
import 'package:sspian/src/providers/deadline.dart';
import 'package:sspian/src/utils/constants.dart';

import 'update_item.dart';

class UpdatesList extends StatefulWidget {
  final int index;

  UpdatesList({this.index});

  @override
  _UpdatesListState createState() => _UpdatesListState();
}

class _UpdatesListState extends State<UpdatesList> {
  List<Update> updateList = [];

  @override
  Widget build(BuildContext context) {
    _setList();

    final updateProvider = Provider.of<UpdateProvider>(context);

    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: Constants.height * 0.04),
        padding: EdgeInsets.symmetric(horizontal: Constants.width * 0.05),
        // child: PaginationView<Update>(
        //   preloadedItems: updateProvider.updates,
        //   itemBuilder: (ctx, announcement, index) {
        //     return UpdateItem(announcement);
        //   },
        //   paginationViewType: PaginationViewType.listView,
        //   pageFetch: updateProvider.pageFetch,
        //   onError: (dynamic error) => Center(
        //     child: Text('Some error occured'),
        //   ),
        //   onEmpty: Center(
        //     child: Text('Sorry! This is empty'),
        //   ),
        //   bottomLoader: Center(
        //     // optional
        //     child: CircularProgressIndicator(),
        //   ),
        //   initialLoader: Center(
        //     // optional
        //     child: CircularProgressIndicator(),
        //   ),
        // ),
        child: ListView.builder(
          itemCount: updateList.length,
          itemBuilder: (ctx, index) {
            return UpdateItem(updateList[index]);
          },
        ),
      ),
    );
  }

  void _setList() {
    final updateProvider = Provider.of<UpdateProvider>(context);

    setState(() {
      updateList = updateProvider.getSpecificDeadline(widget.index);
    });
  }
}
