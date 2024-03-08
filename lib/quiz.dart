import 'package:flutter/material.dart';

import 'start_screen.dart';
import 'questions_screen.dart';
import "data/questions.dart";
import "results_screen.dart";

class Quiz extends StatefulWidget {
  const Quiz({super.key}); // This is required and is the constructor

  @override // This tells Dart that createState was inherited but now overridden
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  var screens = {
    // This is a Map type
    "START": 'start_screen',
    "QUESTIONS": 'questions_screen',
    "RESULTS": 'result_screen',
  };
  var activeScreen = "";

  // The old way stinks as a way to identify screens. Need a way that is not typo sensitive.
  // If you call it start-screen not caught until run time.
  List<String> selectedAnswers =
      []; // List is a class so in C this is just char * selectedAnswers = ...

  void switchScreen() {
    setState(() {
      // Set State is used to force re-rendering
      if (screens.containsKey('QUESTIONS')) {
        activeScreen = screens['QUESTIONS']!;
      } else {
        activeScreen = 'questions_screen';
      }
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        if (screens.containsKey('RESULTS')) {
          activeScreen = screens['RESULTS']!;
        } else {
          activeScreen = 'start_screen';
        }
      });
    }
  }

  void restartQuiz() {
    setState(() {
      selectedAnswers = [];
      if (screens.containsKey('QUESTIONS')) {
        activeScreen = screens['QUESTIONS']!;
      } else {
        activeScreen = 'questions_screen';
      }
    });
  }

  void restartApp() {
    setState(() {
      selectedAnswers = [];
      if (screens.containsKey('START')) {
        activeScreen = screens['START']!;
      }
    });
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(switchScreen);
    if (activeScreen == "" && screens.containsKey('START')) {
      activeScreen = screens['START']!;
    }
    if (screens.containsKey('QUESTIONS') &&
        activeScreen == screens['QUESTIONS']!) {
      screenWidget = QuestionsScreen(
        onSelectAnswer: chooseAnswer,
      );
    }

    if (screens.containsKey('RESULTS') && activeScreen == screens['RESULTS']!) {
      screenWidget = ResultsScreen(
        chosenAnswers: selectedAnswers,
        onRestart: restartQuiz,
        onStart: restartApp,
      );
    }

    return MaterialApp(
      home: Scaffold(
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
