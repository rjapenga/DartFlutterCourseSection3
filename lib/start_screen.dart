import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});
  final void Function() startQuiz;
  @override
  Widget build(BuildContext context) {
    const String appTitle = 'Flutter Quiz';
    return SafeArea(
      // so the widget doesn't intrude upon the OS
      child: MaterialApp(
        title: appTitle,
        // Includes Material Design widgets
        //For a Material app, you can use a Scaffold widget;
        //it provides a default banner, background color, and has API for adding drawers,
        //snack bars, and bottom sheets.
        //Then you can add the Center widget directly to the body property for the home page.
        home: Scaffold(
          appBar: AppBar(
            title: const Text(appTitle),
            backgroundColor: const Color.fromARGB(255, 78, 13, 151),
            foregroundColor: Colors.white,
            centerTitle: true,
            titleTextStyle: const TextStyle(fontSize: 40),
          ),
          body: Center(
            child: Container(
              // Use a Container when you want to add padding, margins, borders, or background color.
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Image.asset(
                    'assets/images/quiz-logo.png',
                    width: 300,
                    color: const Color.fromARGB(150, 255, 255, 255),
                  ),
                  // Opacity(
                  //   opacity: 0.6,
                  //   child: Image.asset(
                  //     'assets/images/quiz-logo.png',
                  //     width: 300,
                  //   ),
                  // ),
/*                  const SizedBox(height: 10),
                  const Text(
                    'Bob\'s Flutter Quiz!',
                    style: TextStyle(
                      color: Color.fromARGB(255, 237, 223, 252),
                      fontSize: 14,
                    ),
                  ),*/
                  const SizedBox(height: 30),
                  OutlinedButton.icon(
                    onPressed: startQuiz,
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.white,
                    ),
                    icon: const Icon(Icons.arrow_right_alt),
                    label: const Text('Start Bob\'s Quiz'),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
