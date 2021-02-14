import 'package:flutter/material.dart';

class ProfileButton extends StatelessWidget {
  final String text;
  final Function callback;

  ProfileButton({this.text, this.callback});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0, left: 30.0, right: 30.0),
      child: OutlineButton(
        onPressed: callback,
        padding: const EdgeInsets.all(12.0),
        highlightedBorderColor: Colors.black87,
        borderSide: BorderSide(color: Colors.black87),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(text),
              Icon(
                Icons.arrow_forward_ios,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
