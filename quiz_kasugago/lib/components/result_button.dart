import 'package:flutter/material.dart';

class ResultButton extends StatelessWidget {
  ResultButton({this.onPressed, this.text});

  final Function onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      minWidth: 300,
      height: 70.0,
      child: OutlineButton(
        borderSide: BorderSide(color: Colors.black, width: 2.0),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            color: Colors.black,
            fontSize: 15.0,
          ),
        ),
      ),
    );
  }
}
