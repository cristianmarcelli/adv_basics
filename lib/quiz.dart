import 'package:adv_basics/data/questions.dart';
import 'package:adv_basics/questions_screen.dart';
import 'package:adv_basics/start_quiz.dart';
import 'package:flutter/material.dart';
import 'package:adv_basics/results_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<StatefulWidget> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  var activeScreen = 'start-screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  void setResultsScreen() {
    setState(() {
      activeScreen = 'results-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        print("selectedAnswers.length " + selectedAnswers.length.toString());
        print("questions.length " + questions.length.toString());
        // selectedAnswers = [];
        activeScreen = 'results-screen';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
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
          child: Center(
            child: currentPage,
          ),
        ),
      ),
    );
  }

  Widget get currentPage {
    if (activeScreen == 'questions-screen') {
      return QuestionsScreen(
        onSelectAnswer: chooseAnswer,
        setResultsScreen: setResultsScreen,
      );
    } else if (activeScreen == 'results-screen') {
      return ResultsScreen(
        chosenAnswers: selectedAnswers,
      );
    }
    return StartQuiz(switchScreen);
  }
}
