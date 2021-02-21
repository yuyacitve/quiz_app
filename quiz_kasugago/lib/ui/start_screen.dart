import 'package:flutter/material.dart';
import 'package:quiz_kasugago/res/res.dart';
import 'package:quiz_kasugago/components/select_level_button.dart';

class StartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  padding: EdgeInsets.all(30.0),
                  child: Text(
                    '春日語クイズ',
                    style:
                        TextStyle(fontSize: 50.0, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SelectLevelButton(
                text: '初級',
                color: Colors.pinkAccent,
                onPressed: () {
                  Navigator.pushNamed(context, '/beginner');
                },
              ),
              SelectLevelButton(
                text: '中級',
                color: Colors.amberAccent,
                onPressed: () {},
              ),
              SelectLevelButton(
                text: '上級',
                color: Colors.lightBlue,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
