import 'dart:math';

import 'package:flutter/material.dart';
import '../../../data/models/quiz_question_model.dart';
import '../../../data/providers/base_view.dart';
import '../../../data/providers/viewmodel/exam_prep_view_model.dart';

class QuestionsPage extends StatefulWidget {
  const QuestionsPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _QuestionsPageState createState() => _QuestionsPageState();
}

class _QuestionsPageState extends State<QuestionsPage> {
  ExamPrepViewModel? model;
  Map<int, String?> selectedAnswers = {};
  int score = 0;
  bool submitted = false;
  List<List<String>>? _shuffledOptions;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _initializeQuiz();
  }

  void _initializeQuiz() async {
    await model?.generateQuestions();
    setState(() {
      _shuffledOptions = model?.questions
          .asMap()
          .map((index, question) =>
              MapEntry(index, model?.shuffleAnswers(question, index)))
          .values.cast<List<String>>()
          .toList();
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<ExamPrepViewModel>(
      onModelReady: (model) {
        this.model = model;
        _initializeQuiz(); // Initialize the quiz when the model is ready
      },
      builder: (context, model, child) {
        return GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            appBar: AppBar(
              title: const Text('5 minute Quiz'),
              actions: [
                IconButton(
                  icon: const Icon(Icons.info_outline),
                  onPressed: () {
                    _showResultsDialog(context);
                  },
                ),
              ],
            ),
            body: _isLoading || _shuffledOptions == null
                ? const Center(child: CircularProgressIndicator())
                : buildQuizPage(context),
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
            itemCount: model?.questions.length,
            itemBuilder: (context, index) {
              final question = model?.questions[index];
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      ' ${index + 1}.${question?.question}',
                      style: const TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    buildOptions(question!, index),
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
              await model?.saveQuizToFirestore();
              _showResultsDialog(context);
            },
            child: const Text('Submit'),
          ),
      ],
    );
  }

  Widget buildOptions(QuizQuestion question, int questionIndex) {
    return Column(
      children: _shuffledOptions![questionIndex].map((option) {
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
      }).toList(),
    );
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
              'Your score: $score/${model?.questions.length}',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: score == model?.questions.length
                    ? Colors.green
                    : (score >= model!.questions.length / 2
                        ? Colors.orange
                        : Colors.red),
              ),
            ),
          ),
        );
      },
    );
  }


  int calculateScore() {
    int score = 0;
    for (int i = 0; i < model!.questions.length; i++) {
      if (selectedAnswers[i] == model!.questions[i].answer) {
        score++;
      }
    }
    return score;
  }
}
