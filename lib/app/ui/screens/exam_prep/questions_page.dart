import 'dart:math';

import 'package:flutter/material.dart';
import '../../../data/models/quiz_question_model.dart';
import '../../../data/providers/base_view.dart';
import '../../../data/providers/viewmodel/exam_prep_view_model.dart';

class QuestionsPage extends StatefulWidget {
  const QuestionsPage({super.key});

  @override
  _QuestionsPageState createState() => _QuestionsPageState();
}

class _QuestionsPageState extends State<QuestionsPage> {
  late ExamPrepViewModel model;
  Map<int, String?> selectedAnswers = {};
  int score = 0;
  bool submitted = false;

  @override
  Widget build(BuildContext context) {
    return BaseView<ExamPrepViewModel>(
      onModelReady: (model) {
        this.model = model;
        model.generateQuestions();
      },
      builder: (context, model, child) {
        return SafeArea(
          child: GestureDetector(
            onTap: () {
              FocusManager.instance.primaryFocus?.unfocus();
              //model.keyboard(false);
            },
            child: Scaffold(
              appBar: AppBar(
                title: const Text('Quiz Questions'),
                actions: [
                  IconButton(
                    icon: const Icon(Icons.info_outline),
                    onPressed: () {
                      _showResultsDialog(context);
                    },
                  ),
                ],
              ),
              body: model.questions.isEmpty
                  ? const Center(child: CircularProgressIndicator())
                  : buildQuizPage(context),
            ),
          ),
        );
      },
    );
  }

  Widget buildQuizPage(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: model.questions.length,
            itemBuilder: (context, index) {
              final question = model.questions[index];
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      question.question,
                      style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    ...buildOptions(question, index),
                  ],
                ),
              );
            },
          ),
        ),
        if (!submitted)
          ElevatedButton(
            onPressed: () async {
              setState(() {
                submitted = true;
                score = calculateScore();
              });
              await model.saveQuizToFirestore();
              _showResultsDialog(context);
            },
            child: const Text('Submit'),
          ),
      ],
    );
  }

  List<Widget> buildOptions(QuizQuestion question, int questionIndex) {
    List<String> allOptions = List.from(question.incorrectAnswers)
      ..add(question.answer);
    allOptions.shuffle(); // Shuffle the options to place the correct answer randomly

    List<Widget> options = allOptions.map((option) {
      return RadioListTile<String>(
        title: Text(
          option,
          style: TextStyle(
            color: submitted && selectedAnswers[questionIndex] == option
                ? (option == question.answer ? Colors.green : Colors.red)
                : null,
          ),
        ),
        value: option,
        groupValue: selectedAnswers[questionIndex],
        onChanged: submitted
            ? null
            : (value) {
                setState(() {
                  selectedAnswers[questionIndex] = value;
                });
              },
      );
    }).toList();

    return options;
  }

  void _showResultsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Quiz Results'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Close'),
            ),
          ],
          content: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              'Your score: $score/${model.questions.length}',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: score == model.questions.length
                    ? Colors.green
                    : (score >= model.questions.length / 2 ? Colors.orange : Colors.red),
              ),
            ),
          ),
        );
      },
    );
  }

  int calculateScore() {
    int score = 0;
    for (int i = 0; i < model.questions.length; i++) {
      if (selectedAnswers[i] == model.questions[i].answer) {
        score++;
      }
    }
    return score;
  }
}
