import 'package:flutter/material.dart';

import '../../../data/hive_adapter/quiz_history.dart';


class QuizDetailPage extends StatelessWidget {
  final List<QuizQuestion> questions;
  final List<UserAnswer> answers;

  const QuizDetailPage({required this.questions, required this.answers});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Quiz Details')),
      body: ListView.builder(
        itemCount: questions.length,
        itemBuilder: (context, index) {
          var question = questions[index];
          var userAnswer = answers.firstWhere((answer) => answer.questionIndex == index).selectedAnswer;
          return ListTile(
            title: Text(question.question),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ...question.incorrectAnswers.map((answer) => Text(answer)),
                Text(
                  question.answer,
                  style: const  TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  'Your answer: $userAnswer',
                  style: TextStyle(
                    color: userAnswer == question.answer ? Colors.green : Colors.red,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}