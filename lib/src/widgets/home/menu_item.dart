import 'package:flutter/material.dart';
import 'package:random_color/random_color.dart';
import 'package:sspian/src/utils/utils.dart';

class MenuItem extends StatelessWidget {
  final String title;
  final IconData iconData;
  final String routeName;
  final Color color;

  MenuItem({Key key, this.title, this.iconData, this.routeName, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        margin: EdgeInsets.symmetric(
            horizontal: Utils.size.width * 0.02,
            vertical: Utils.size.height * 0.01),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        child: Container(
          margin: EdgeInsets.only(bottom: Utils.size.height * 0.005),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
          child: _buildColumn(context),
        ),
      ),
      onTap: () => onTap(context),
    );
  }

  _buildColumn(context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          iconData,
          size: Utils.size.width * 0.09,
          color: color,
        ),
        SizedBox(
          height: Utils.size.height * 0.01,
        ),
        Text(
          title,
          style: TextStyle(color: Theme.of(context).accentColor, fontSize: 15),
        ),
      ],
    );
  }

  void onTap(context) {
    Navigator.of(context).pushNamed(routeName);
  }
}
