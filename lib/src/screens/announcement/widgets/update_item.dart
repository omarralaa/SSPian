import 'package:flutter/material.dart';
import 'package:sspian/src/models/update.dart';
import 'package:sspian/src/utils/factory_utils.dart';
import 'package:sspian/src/utils/constants.dart';

class UpdateItem extends StatelessWidget {
  final Update _update;

  UpdateItem(this._update);

  final FactoryUtils _factoryUtils = FactoryUtils();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Constants.height * 0.18,
      margin: EdgeInsets.symmetric(
        vertical: Constants.height * 0.02,
      ),
      padding: EdgeInsets.only(
        left: Constants.width * 0.05,
        right: Constants.width * 0.01,
        top: Constants.height * 0.01,
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
          SizedBox(height: Constants.height * 0.015),
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
            horizontal: Constants.width * 0.02,
            vertical: Constants.height * 0.006,
          ),
          decoration: BoxDecoration(
            color: _factoryUtils.getAnnouncementColor(_update),
            borderRadius: BorderRadius.all(
              Radius.circular(Constants.width * 0.018),
            ),
          ),
          child: Text(
            _factoryUtils.getAnnouncementType(_update).toUpperCase(),
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
      _update.body,
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
      _update.dateCreated.toString(),
      style: TextStyle(
        color: Color(0xffbbbbbb),
        fontSize: 12,
      ),
    );
  }
}
