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
  // This is required
  var screens = ['start_screen', 'questions_screen', 'result_screen'];
  String activeScreen = screens[
      0]; // Stinks as a way to identify screens. Need a way that is not typo sensitive.
  // If you call it start-screen not caught until run time.
  List<String> selectedAnswers =
      []; // List is a class so in C this is just char * selectedAnswers = ...

  void switchScreen() {
    setState(() {
      // Set State is used to force re-rendering
      activeScreen = "questions_screen";
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = "results_screen";
      });
    }
  }

  void restartQuiz() {
    setState(() {
      selectedAnswers = [];
      activeScreen = 'questions_screen';
    });
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == 'questions_screen') {
      screenWidget = QuestionsScreen(
        onSelectAnswer: chooseAnswer,
      );
    }

    if (activeScreen == 'results_screen') {
      screenWidget = ResultsScreen(
        chosenAnswers: selectedAnswers,
        onRestart: restartQuiz,
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
