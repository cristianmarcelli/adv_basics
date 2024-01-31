import 'package:adv_basics/models/answer_button.dart';
import 'package:flutter/material.dart';
import 'package:adv_basics/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({
    super.key,
    required this.onSelectAnswer,
    required this.setResultsScreen,
  });

  final void Function(String answer) onSelectAnswer;
  final void Function() setResultsScreen;

  @override
  State<StatefulWidget> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;

  // void answerQuestion(String selectedAnswer) {
  //   widget.onSelectAnswer(selectedAnswer);
  //   setState(() {
  //     // currentQuestionIndex++;

  //     // ??????????

  //     if (currentQuestionIndex < questions.length - 1) {
  //       currentQuestionIndex++;
  //     } else {
  //       // Se è stata risposta l'ultima domanda, passa alla schermata dei risultati
  //       widget.onSelectAnswer(selectedAnswer); // Aggiungi la risposta finale
  //       Navigator.push(
  //         context,
  //         MaterialPageRoute(
  //           builder: (context) => const ResultsScreen(
  //             chosenAnswers: [],
  //           ),
  //         ),
  //       );
  //     }

  //     // ??????????
  //   });
  // }

  void answerQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);
    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
      });
    } else {
      widget.setResultsScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];

    // Si rompe qui
    print("currentquestioindex " + currentQuestionIndex.toString());
    print("currentQuestion " + currentQuestion.text);

    return Container(
      margin: const EdgeInsets.all(65),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            currentQuestion.text,
            style: GoogleFonts.montserrat(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),
          ...currentQuestion.shuffledAnswers.map((answer) {
            return AnswerButton(
              answerText: answer,
              onTap: () {
                answerQuestion(answer);
              },
            );
          }),
        ],
      ),
    );
  }
}
