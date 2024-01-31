import 'package:flutter/material.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              child: Row(
                children: [
                  Container(
                    width: 50,
                    height: 30,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.black87, width: 1.0),
                      color: Colors.white,
                    ),
                    child: Center(
                      child: Text(
                        ((data['question_index'] as int) + 1).toString(),
                        style: const TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data['question'] as String,
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5),
                        buildAnswerRow(data),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget buildAnswerRow(Map<String, dynamic> data) {
    String userAnswer = data['user_answer'] as String;
    String correctAnswer = data['correct_answer'] as String;

    if (userAnswer == correctAnswer) {
      return Row(
        children: [
          Text(correctAnswer),
          const SizedBox(width: 5),
          const Icon(
            Icons.check_circle,
            color: Colors.blue,
            size: 18,
          ),
        ],
      );
    } else {
      return Column(
        children: [
          Row(
            children: [
              Text(userAnswer),
              const SizedBox(width: 5),
              const Icon(
                Icons.cancel,
                color: Colors.red,
                size: 18,
              ),
            ],
          ),
          Row(
            children: [
              Text(correctAnswer),
              const SizedBox(width: 5),
              const Icon(
                Icons.check_circle,
                color: Colors.blue,
                size: 18,
              ),
            ],
          ),
        ],
      );
    }
  }
}
