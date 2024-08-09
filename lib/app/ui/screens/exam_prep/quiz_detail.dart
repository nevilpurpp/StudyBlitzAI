import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../data/models/quiz_question_model.dart';

class QuizDetailPage extends StatelessWidget {
  final QueryDocumentSnapshot data;
  const QuizDetailPage({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var questions = (data['questions'] as List).map((item) => QuizQuestion.fromJson(item)).toList();
    var selectedAnswers = Map<int, String>.from(data['selectedAnswers']);
    return Scaffold(
      appBar: AppBar(
        title: Text('Recent questions - ${data['subject']}'),
      ),
      body: Column(
        children: [
          ListView.builder(
            itemCount: questions.length,
            itemBuilder: (context, index) {
              var question = questions[index];
              var selectedAnswer = selectedAnswers[index];
              return ListTile(
                title: Text(' ${index + 1}.${question.question}'),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      question.answer,
                      style: TextStyle(
                        color: selectedAnswer == question.answer ? Colors.green : null,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          //save to file - docx/pdf
        ],
        
      ),
    );
  }
}
