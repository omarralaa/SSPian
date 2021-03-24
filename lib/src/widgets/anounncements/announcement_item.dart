import 'package:flutter/material.dart';
import 'package:sspian/src/models/announcement.dart';
import 'package:sspian/src/utils/factory_utils.dart';
import 'package:sspian/src/utils/utils.dart';

class AnnouncementItem extends StatelessWidget {
  final Announcement _announcement;

  AnnouncementItem(this._announcement);

  final FactoryUtils _factoryUtils = FactoryUtils();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Utils.size.height * 0.18,
      margin: EdgeInsets.symmetric(
        vertical: Utils.size.height * 0.02,
      ),
      padding: EdgeInsets.only(
        left: Utils.size.width * 0.05,
        right: Utils.size.width * 0.01,
        top: Utils.size.height * 0.01,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(),
          _buildTitle(context),
          SizedBox(height: Utils.size.height * 0.015),
          _buildTimeAgo(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: Utils.size.width * 0.02,
            vertical: Utils.size.height * 0.006,
          ),
          decoration: BoxDecoration(
            color: _factoryUtils.getAnnouncementColor(_announcement),
            borderRadius: BorderRadius.all(
              Radius.circular(Utils.size.width * 0.018),
            ),
          ),
          child: Text(
            _factoryUtils.getAnnouncementType(_announcement).toUpperCase(),
            style: TextStyle(
              color: Colors.white,
              fontSize: 13,
            ),
          ),
        ),
        IconButton(
          icon: Icon(Icons.more_vert),
          onPressed: () {},
        )
      ],
    );
  }

  Widget _buildTitle(context) {
    return Text(
      _announcement.body,
      maxLines: 2,
      softWrap: true,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: 15,
        color: Color(0xff333b41),
      ),
    );
  }

  Widget _buildTimeAgo() {
    return Text(
      _announcement.dateCreated.toString(),
      style: TextStyle(
        color: Color(0xffbbbbbb),
        fontSize: 12,
      ),
    );
  }
}
