import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quiz_kasugago/components/select_level_button.dart';
import 'package:quiz_kasugago/components/select_answer_button.dart';
import 'package:quiz_kasugago/model/quiz_brain.dart';
import 'package:provider/provider.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:quiz_kasugago/admob/banner_admob_id.dart';
import 'package:quiz_kasugago/components/result_button.dart';
import 'package:quiz_kasugago/admob/interstitial_ad_id.dart';
import 'package:quiz_kasugago/ui/result_screen.dart';

class BeginnerScreen extends StatefulWidget {
  @override
  _BeginnerScreenState createState() => _BeginnerScreenState();
}

class _BeginnerScreenState extends State<BeginnerScreen> {
  BannerAd myBanner;

  InterstitialAd interstitialAd;
  bool isInterstitialAdReady;

  void initState() {
    super.initState();

    FirebaseAdMob.instance.initialize(appId: BannerAdManager.appId);
    FirebaseAdMob.instance.initialize(appId: InterstitialAdManager.appId);

    myBanner = BannerAd(
      //テスト用
      adUnitId: BannerAd.testAdUnitId,
      //  本番用
      // adUnitId: AdManager.bannerAdUnitId

      size: AdSize.smartBanner,
      listener: (MobileAdEvent event) {
        print('interstitial event is $event');
      },
    );

    interstitialAd = InterstitialAd(
      //  テスト用
      adUnitId: InterstitialAd.testAdUnitId,
      //  本番用
      //  adUnitId: AdManager.interstitialUnitId

      listener: (MobileAdEvent event) {
        if (event == MobileAdEvent.loaded)
          SystemChrome.setEnabledSystemUIOverlays([]);
        else if (event == MobileAdEvent.closed)
          SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
        print('BannerAd event is $event');
      },
    );

    myBanner
      ..load()
      ..show(
        anchorOffset: 0.0,
        anchorType: AnchorType.bottom,
      );
  }

  @override
  void dispose() {
    myBanner?.dispose();
    interstitialAd?.dispose();

    super.dispose();
  }

  Widget build(BuildContext context) {
    return Consumer<QuizBrain>(
      builder: (context, quizBrain, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.pinkAccent,
            title: Text(
              '春日語クイズ',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          body: quizBrain.isEnable
              ? Container(
                  padding: EdgeInsets.only(
                      top: 20.0, left: 30.0, right: 30.0, bottom: 30.0),
                  child: Column(
                    children: [
                      Row(
                        children: quizBrain.scoreKeeper,
                      ),
                      Text(
                        'Q${quizBrain.questionIndex + 1}/10 ',
                        style: TextStyle(fontSize: 30.0, color: Colors.black),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        '次の春日語に合う意味を選んでください',
                        style: TextStyle(fontSize: 15.0),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 30.0),
                        width: double.infinity,
                        height: 100,
                        child: Text(
                          quizBrain.randomBeginnerQuestion.question,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 30.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 25.0,
                      ),
                      SelectAnswerButton(
                          text: quizBrain.beginnerQuestion.a,
                          onPressed: () {
                            quizBrain.checkAnswer('A');
                            quizBrain.nextQuestion(10);
                            if (quizBrain.questionIndex == 7) {
                              interstitialAd.load();
                            }
                          }),
                      SizedBox(
                        height: 25.0,
                      ),
                      SelectAnswerButton(
                          text: quizBrain.beginnerQuestion.b,
                          onPressed: () {
                            quizBrain.checkAnswer('B');
                            quizBrain.nextQuestion(10);
                            if (quizBrain.questionIndex == 7) {
                              interstitialAd.load();
                            }
                          }),
                      SizedBox(
                        height: 25.0,
                      ),
                      SelectAnswerButton(
                          text: quizBrain.beginnerQuestion.c,
                          onPressed: () {
                            quizBrain.checkAnswer('C');
                            quizBrain.nextQuestion(10);
                            if (quizBrain.questionIndex == 7) {
                              interstitialAd.load();
                            }
                          }),
                    ],
                  ),
                )
              : Center(
                  child: Container(
                    child: ResultButton(
                      onPressed: () {
                        interstitialAd..show();
                        Navigator.pushNamed(context, '/result');
                      },
                      text: '結果へ',
                    ),
                  ),
                ),
        );
      },
    );
  }
}
