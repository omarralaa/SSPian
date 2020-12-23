import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class SocialLoginFooter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RawMaterialButton(
            onPressed: () {},
            fillColor: Colors.white,
            child: Icon(
              FontAwesome.google,
              size: MediaQuery.of(context).size.height * 0.05,
            ),
            padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.025),
            shape: CircleBorder(
              side: BorderSide(
                color: Colors.black,
                width: 2,
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.05,
          ),
          RawMaterialButton(
            onPressed: () {},
            fillColor: Colors.white,
            child: Icon(
              FontAwesome.facebook,
              size: MediaQuery.of(context).size.height * 0.05,
            ),
            padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.025),
            shape: CircleBorder(
              side: BorderSide(
                color: Colors.black,
                width: 2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
