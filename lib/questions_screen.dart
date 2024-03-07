import 'package:flutter/material.dart';
import "package:google_fonts/google_fonts.dart";
import 'answer_button.dart';
import 'data/questions.dart';
import 'quiz.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;
  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;
  void answerQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuestionIndex];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ...currentQuestion.getShuffledAnswers().map(
              (answer) {
                return AnswerButton(
                  answerText: answer,
                  onTap: () {
                    answerQuestion(answer);
                  },
                );
              },
            ),
          ], // children of column
        ),
      ),
    );
  }
}

class QS2 extends StatefulWidget {
  const QS2({super.key, required this.onSelectAnswer});
  final void Function(String answer) onSelectAnswer;

  @override
  State<QS2> createState() {
    return _QS2State();
  }
}

class _QS2State extends State<QS2> {
  final List<String> entries = <String>[
    'A',
    'B',
    'This is the day that the Lord has made. Let us rejoice and be glad in it',
    'D',
    'E',
    'F',
    'G',
    'H',
    'I',
    'J',
    'K',
    'L',
    'M',
    'N',
    'O',
  ];
  final List<int> colorCodes = <int>[
    600,
    500,
    100,
    600,
    500,
    100,
    600,
    500,
    100,
    600,
    500,
    100,
    600,
    500,
    100,
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView.separated(
        padding: const EdgeInsets.all(8),
        itemCount: entries.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 50,
            color: Colors.amber[colorCodes[index]],
//            child: Center(child: Text('Entry ${entries[index]}')),
            child: Center(
                child: ElevatedButton(
                    child: Text(
                      'Entry ${entries[index]}',
                    ),
                    onPressed: () {
                      const Quiz();
                    })),
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      ),
    );
  } /*  
  final List datas = [1, 2, 3, 4, 5, 6];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate.fixed(
              [
                ...datas.map((e) => ExpansionTile(
                    title: Text(
                      e.toString(),
                    ),
                    children: List.generate(
                      datas.length,
                      (index) {
                        return ElevatedButton(
                            onPressed: () {},
                            child: Text(datas[index].toString()));
                      },
                    )))
                //.toList(),
              ],
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Test'),
              ),
            ),
          )
        ],
      )),
    );
  }
  */
}
