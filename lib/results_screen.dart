import 'package:flutter/material.dart';
import "package:google_fonts/google_fonts.dart";
import 'data/questions.dart';
import 'data/enums.dart';
import 'questions_summary/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    super.key,
    required this.chosenAnswers,
    required this.onRestart,
    required this.onStart,
  });
  final void Function() onRestart;
  final void Function() onStart;

  final List<String> chosenAnswers;

  List<Map<Enum, Object>> getSummaryData() {
    final List<Map<Enum, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add(
        {
          Summary.questionIndex: i,
          Summary.question: questions[i].text,
          Summary.correctAnswer: questions[i].answers[0],
          Summary.userAnswer: chosenAnswers[i]
        },
      );
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final numTotalQuestions = questions.length;
    final summaryData = getSummaryData();
    final numCorrectAnswers = summaryData.where((data) {
      return data[Summary.userAnswer] == data[Summary.correctAnswer];
    }).length;
    final encourageDiscourage =
        numCorrectAnswers >= 4 ? "Well done!!!" : "Keep working";
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You have answered $numCorrectAnswers out of $numTotalQuestions questions correctly! $encourageDiscourage.',
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 10,
            ),
            QuestionsSummary(summaryData),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton.icon(
              onPressed: onRestart,
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.blue[400],
              ),
              icon: const Icon(Icons.refresh),
              label: const Text('Restart Quiz!'),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton.icon(
              onPressed: onStart,
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.blue[400],
              ),
              icon: const Icon(Icons.start),
              label: const Text('Restart App!'),
            )
          ],
        ),
      ),
    );
  }
}
