import 'dart:math';

import 'package:flutter/material.dart';
import 'question.dart';
import 'package:quiz_kasugago/ui/result_screen.dart';
import 'package:quiz_kasugago/components/select_answer_button.dart';

class QuizBrain extends ChangeNotifier {
  int _questionIndex = 0;
  String correctAnswer;
  bool isEnable = true;

  List<bool> correctAnswers = [];
  List<Icon> scoreKeeper = [];
  List<Question> _beginnerQuestionBank = [
    Question(
        question: 'ごんすな', a: '〜です', b: 'ゴキブリ', c: 'わかった', correctAnswer: 'A'),
    Question(
        question: 'キャバレー', a: '車', b: 'キャビア', c: 'キャバクラ', correctAnswer: 'C'),
    Question(question: 'ウィ', a: 'Wii', b: 'はい', c: 'おはよう', correctAnswer: 'B'),
    Question(
        question: 'びっくらこいた',
        a: '〜です',
        b: 'びっくりしました',
        c: '大好きです',
        correctAnswer: 'B'),
    Question(question: '便ステ', a: '飛行機', b: 'トイレ', c: '勉強', correctAnswer: 'B'),
    Question(
        question: 'うまし', a: '美味しい', b: 'うまい棒', c: '元気', correctAnswer: 'A'),
    Question(
        question: 'コンビニエンス',
        a: 'コンビニ',
        b: 'ファミレス',
        c: '焼肉',
        correctAnswer: 'A'),
    Question(question: 'ブーブー', a: '相撲', b: '赤ちゃん', c: '車', correctAnswer: 'C'),
    Question(question: 'ズーミー', a: '水', b: '水曜日', c: 'おにぎり', correctAnswer: 'A'),
    Question(
        question: '自分磨き',
        a: 'カッコよくなる努力',
        b: '洗顔',
        c: 'オナニー',
        correctAnswer: 'C'),
    Question(
        question: '国際交流',
        a: '外国人と話す',
        b: '外国人とのSEX',
        c: '観光案内',
        correctAnswer: 'B'),
    Question(
        question: 'ラブメイト', a: 'オタク', b: 'ラブライブ', c: '相方', correctAnswer: 'C'),
    Question(
        question: 'お手合わせ', a: 'セックス', b: 'お見合い', c: '対決', correctAnswer: 'A'),
    Question(question: 'ワンス', a: '犬', b: '猫', c: 'もう一回', correctAnswer: 'C'),
    Question(
        question: 'ひとつよしなに',
        a: 'もう一度',
        b: 'おはよう',
        c: 'どうぞよろしく',
        correctAnswer: 'C'),
    Question(
        question: 'メイキャップルーム',
        a: 'ファーストフード店',
        b: 'メイク室',
        c: 'ペットボトルの蓋',
        correctAnswer: 'B'),
    Question(
        question: 'プリント倶楽部',
        a: 'プリクラ',
        b: '写真家',
        c: 'プリンター',
        correctAnswer: 'A'),
    Question(
        question: 'ムズですね',
        a: 'ムカデ',
        b: '明日ですね',
        c: '難しいですね',
        correctAnswer: 'C'),
    Question(
        question: 'プレゼンテーション',
        a: '発表会',
        b: 'プレゼント',
        c: '演説',
        correctAnswer: 'B'),
    Question(question: 'うそこ', a: '嘘', b: 'ムカデ', c: '子供', correctAnswer: 'A'),
    Question(
        question: 'かぶりっこちゃん',
        a: 'カプリコ',
        b: '同じものが重なること',
        c: '皮被り',
        correctAnswer: 'B'),
    Question(
        question: 'なめこま',
        a: 'なめこ',
        b: 'なめくじ',
        c: '舐めて貰っちゃ困る',
        correctAnswer: 'C'),
    Question(
        question: 'Gルド', a: 'ゴールドジム', b: '金', c: 'カラス', correctAnswer: 'A'),
    Question(
        question: 'HEY！たくちゃん',
        a: '拓郎',
        b: 'お疲れ様',
        c: 'ヘイタク',
        correctAnswer: 'B'),
    Question(question: '魚', a: '釣り', b: '友達', c: '春日の一人称', correctAnswer: 'C'),
    Question(
        question: 'キビ', a: '厳しい', b: 'サトウキビ', c: 'きびきび動く', correctAnswer: 'A'),
    Question(
        question: 'Dキャン',
        a: 'ディズニー',
        b: 'ドキドキキャンプ',
        c: 'ドラマキャンペーン',
        correctAnswer: 'B'),
    Question(
        question: '携帯の電',
        a: '携帯電話',
        b: '隣にいます',
        c: 'ひまわりの約束',
        correctAnswer: 'A'),
    Question(question: '若の字', a: '弱い', b: '疲れた', c: '若林', correctAnswer: 'C'),
  ];

  List _shuffle(List beginnerQuestionBank) {
    var random = new Random();
    for (var i = beginnerQuestionBank.length - 1; i > 0; i--) {
      var n = random.nextInt(i + 1);
      var temp = beginnerQuestionBank[i];
      beginnerQuestionBank[i] = beginnerQuestionBank[n];
      beginnerQuestionBank[n] = temp;
    }
    return beginnerQuestionBank;
  }

  int get questionIndex {
    return _questionIndex;
  }

  Question get beginnerQuestion {
    return _beginnerQuestionBank[questionIndex];
  }

  Question get randomBeginnerQuestion {
    return _shuffle(_beginnerQuestionBank)[questionIndex];
  }

  void nextQuestion(int quizCount) {
    if (_questionIndex < quizCount - 1) {
      _questionIndex++;
      notifyListeners();
    } else {
      isEnable = false;
      notifyListeners();
    }
  }

  void checkAnswer(String userPickedAnswer) {
    if (beginnerQuestion.correctAnswer == userPickedAnswer) {
      final bool correctedAnswer = true;
      correctAnswers.add(correctedAnswer);
      scoreKeeper.add(Icon(
        Icons.radio_button_unchecked,
        color: Colors.red,
      ));
      notifyListeners();
    } else {
      scoreKeeper.add(
        Icon(
          Icons.close,
          color: Colors.blueAccent,
        ),
      );
      notifyListeners();
    }
  }

  void reset() {
    _questionIndex = 0;
    correctAnswers = [];
    scoreKeeper = [];
    isEnable = true;
    notifyListeners();
  }
}
