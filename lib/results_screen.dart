import 'package:adv_basics/quiz.dart';
import 'package:flutter/material.dart';
import 'package:adv_basics/data/questions.dart';
import 'package:adv_basics/questions_summary.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key, required this.chosenAnswers});

  final List<String> chosenAnswers;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add(
        {
          'question_index': i,
          'question': questions[i].text,
          'correct_answer': questions[i].answers[0],
          'user_answer': chosenAnswers[i]
        },
      );
    }

    print("HELLO " + summary.toString());
    return summary;
  }

  // @override
  // Widget build(BuildContext context) {
  //   return SizedBox(
  //     width: double.infinity,
  //     child: Container(
  //       margin: const EdgeInsets.all(40),
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: [
  //           const Text('You answered X out of Y questions correctly!'),
  //           const SizedBox(
  //             height: 30,
  //           ),
  //           QuestionSummary(getSummaryData()),
  //           const SizedBox(
  //             height: 30,
  //           ),
  //           TextButton(
  //             onPressed: () {},
  //             child: const Text('Restart Quiz!'),
  //           )
  //         ],
  //       ),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        decoration: const BoxDecoration(
          // Add this decoration to the Container
          gradient: LinearGradient(
            colors: [
              Colors.white,
              Colors.green,
              Color.fromARGB(255, 4, 43, 16),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered X out of Y questions correctly!',
              style: GoogleFonts.montserrat(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            QuestionSummary(getSummaryData()),
            const SizedBox(
              height: 30,
            ),
            const SizedBox(
              height: 60,
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Quiz()),
                );
              },
              child: const Text('Restart Quiz!'),
            ),
          ],
        ),
      ),
    );
  }
}
