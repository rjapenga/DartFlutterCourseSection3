import 'package:flutter/material.dart';

import 'start_screen.dart'; // I don't know how much is imported - not like include in C
import 'questions_screen.dart';
import "data/questions.dart";
import "results_screen.dart";
import 'data/enums.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key}); // This is required and is the constructor

  @override // This tells Dart that createState was inherited but now overridden
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
/*  static const String startKey = 'START';
  static const String questionsKey = "QUESTIONS";
  static const String resultsKey = "RESULTS";

  final Map screens = const {
    startKey: 'start_screen',
    questionsKey: 'questions_screen',
    resultsKey: 'result_screen',
  };
*/
  var activeScreen = Screens.startKey;

  // The old way stinks as a way to identify screens. Need a way that is not typo sensitive.
  // If you call it start-screen not caught until run time.
  // Using enums works
  List<String> selectedAnswers =
      []; // List is a class so in C this is just char * selectedAnswers = ...

  void switchScreen() {
    setState(() {
      // setState is used to update the UI
      // Set State is used to force re-rendering
      activeScreen = Screens.questionsKey;
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = Screens.resultsKey;
      });
    }
  }

  void restartQuiz() {
    setState(() {
      selectedAnswers = [];
      activeScreen = Screens.questionsKey;
    });
  }

  void restartApp() {
    setState(() {
      selectedAnswers = [];
      activeScreen = Screens.startKey;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen(switchScreen);
    if (activeScreen == Screens.questionsKey) {
      screenWidget = QuestionsScreen(
        onSelectAnswer:
            chooseAnswer, // we are passing a function to the widget.
      );
    }

    if (activeScreen == Screens.resultsKey) {
      screenWidget = ResultsScreen(
        chosenAnswers: selectedAnswers, // Passing a list for results to fill
        onRestart: restartQuiz, // passing a function for a button to press
        onStart: restartApp, // passing a function for a button to press
      );
    }

    return MaterialApp(
      home: Scaffold(
        // Why not scaffold ever where?
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 78, 13, 151),
                Color.fromARGB(255, 107, 15, 168),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
