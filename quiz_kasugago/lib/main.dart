import 'package:flutter/material.dart';
import 'package:quiz_kasugago/model/quiz_brain.dart';
import 'package:quiz_kasugago/ui/advanced_screen.dart';
import 'package:quiz_kasugago/ui/master_screen.dart';
import 'package:quiz_kasugago/ui/quiz_beginner_screen.dart';
import 'package:quiz_kasugago/ui/result_screen.dart';
import 'package:quiz_kasugago/ui/start_screen.dart';
import 'package:provider/provider.dart';
import 'package:quiz_kasugago/model/quiz_brain.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  // Ensure that Firebase is initialized

  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase

  await Firebase.initializeApp();
  //

  runApp(KasugaApp());
}

class KasugaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => QuizBrain(),
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => StartScreen(),
          '/beginner': (context) => BeginnerScreen(),
          '/advance': (context) => AdvancedScreen(),
          '/master': (context) => MasterScreen(),
          '/result': (context) => ResultScreen(),
        },
      ),
    );
  }
}
