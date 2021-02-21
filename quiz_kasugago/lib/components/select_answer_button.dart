import 'package:flutter/material.dart';
import 'package:quiz_kasugago/model/quiz_brain.dart';
import 'package:quiz_kasugago/res/res.dart';

class SelectAnswerButton extends StatelessWidget {
  SelectAnswerButton(
      {@required this.text, @required this.onPressed, this.isEnabled = true});

  final String text;
  final Function onPressed;
  bool isEnabled;

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      minWidth: 300.0,
      height: 60.0,
      child: RaisedButton(
        elevation: 5.0,
        color: Colors.pinkAccent,
        shape: const StadiumBorder(),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
              fontSize: 18.0, color: Colors.white, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
