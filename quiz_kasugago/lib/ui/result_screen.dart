import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_kasugago/components/navigator_button.dart';
import 'package:quiz_kasugago/model/quiz_brain.dart';
import 'package:quiz_kasugago/model/result_level.dart';
import 'package:quiz_kasugago/components/navigator_button.dart';

class ResultScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<QuizBrain>(builder: (context, quizBrain, child) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pinkAccent,
          automaticallyImplyLeading: false,
          title: Text('春日語クイズ'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.only(
                top: 20.0, right: 20.0, left: 20.0, bottom: 70.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      '結果発表',
                      style: TextStyle(
                          fontSize: 40.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Column(
                    children: [
                      Text(
                        '${quizBrain.correctAnswers.length}点',
                        style: TextStyle(
                            fontSize: 80.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.pinkAccent),
                      ),
                      SizedBox(
                        height: 60.0,
                      ),
                      Text(
                        LevelResult()
                            .getLevelResult(quizBrain.correctAnswers.length),
                        style: TextStyle(fontSize: 35.0, color: Colors.black),
                      ),
                    ],
                  ),
                ),
                NavigatorButton(
                  onPressed: () {
                    quizBrain.reset();
                    Navigator.popUntil(context, ModalRoute.withName('/'));
                  },
                  text: 'タイトルへ',
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
