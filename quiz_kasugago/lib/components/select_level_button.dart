import 'package:flutter/material.dart';
import 'package:quiz_kasugago/res/res.dart';

class SelectLevelButton extends StatelessWidget {
  SelectLevelButton(
      {@required this.text, @required this.color, @required this.onPressed});

  final String text;
  final Color color;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(13.0),
        child: FlatButton(
          color: color,
          onPressed: onPressed,
          child: Text(
            text,
            style: kSelectLevelTextStyle,
          ),
        ),
      ),
    );
  }
}
