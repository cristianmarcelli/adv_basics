import 'package:adv_basics/quiz.dart';
import 'package:flutter/material.dart';
import 'package:adv_basics/data/questions.dart';
import 'package:adv_basics/questions_summary.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key, required this.chosenAnswers});

  final List<String> chosenAnswers;

  @override
  Widget build(BuildContext context) {
    final numTotalQuestions = questions.length;
    final numCorrectoQuestions = summaryData
        .where((data) => data['user_answer'] == data['correct_answer'])
        .length;

    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'You answered $numCorrectoQuestions out of $numTotalQuestions questions correctly!',
            style: GoogleFonts.montserrat(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 50,
          ),
          QuestionSummary(summaryData),
          const SizedBox(
            height: 50,
          ),
          // TextButton(
          //   onPressed: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(builder: (context) => const Quiz()),
          //     );
          //   },
          //   child: const Text('Restart Quiz!'),
          // ),
          ElevatedButton.icon(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Quiz()),
              );
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white, foregroundColor: Colors.black),
            icon: const Icon(Icons.restart_alt),
            label: const Text('Restart Quiz'),
          )
        ],
      ),
    );
  }

  List<Map<String, Object>> get summaryData {
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

    return summary;
  }
}
