import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nevilai/app/data/models/quiz_question_model.dart';
import '../../../core/utils/utils.dart';
import '../../middleware/api_services.dart';
import 'auth_view_model.dart';
import 'base_model.dart';
import 'chat_view_model.dart';

class ExamPrepViewModel extends BaseModel {
  TextEditingController topicController = TextEditingController();
   TextEditingController subjectController = TextEditingController();
  String? selectedSubject;
  GoogleGenerativeServices generativeServices = GoogleGenerativeServices();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  AuthViewModel auth = AuthViewModel();

  List<QuizQuestion> questions = [];
  Map<int, String?> selectedAnswers = {};
  int correctAnswers = 0;
  int incorrectAnswers = 0;

  // Fetch modules for the user's course ID
  Stream<QuerySnapshot> getModules(String courseId) {
    print("Fetching modules for course ID: $courseId"); // Debug print
    return firestore.collection('courses').doc(courseId).collection('modules').snapshots();
  }

  // Fetch subjects based on the selected module
 Stream<QuerySnapshot<Map<String, dynamic>>> getSubjects(String moduleId) {
  print("Fetching subjects for module ID: $moduleId"); // Debug print
 return firestore.collection('modules').doc(moduleId).collection('subjects').snapshots();
}

  String constructPrompt() {
    String topic = topicController.text;
    String subject = subjectController.text;
    return '''
    You will be given a subject and a topic. Your aim is to generate questions and answers in a list dictionary.
    The questions are multiple choice, so you will generate the question, the answer, and 3 incorrect answers.
    Here is an example of how your response should look like:
   [
  {
    "question": "What is biology?",
    "answer": "It is the study of living organisms",
    "incorrect_answers": ["It is the study of animals", "Study of soil", "Study of marine life", "Eating of animals"]
  },
  {
    "question": "What is mathematics?",
    "answer": "It is the study of numbers, shapes, and quantities",
    "incorrect_answers": ["It is the study of animals", "Study of soil", "Study of marine life", "Eating of animals"]
  }
]

     The subject is $subject, topic is $topic
     Just output what is expected, don't add any introduction.
    ''';
  }

  Future<List> generateQuestions() async {
    try {
      final questionsResponse = await generativeServices.getquiz(constructPrompt());
      questions = questionsResponse.map((item) => QuizQuestion.fromJson(item)).toList();

      updateUI(); // Update UI with the retrieved summary
      notifyListeners();
      return questions;
    } catch (error) {
      // Handle potential errors during API call
      AppUtils.showError('$error');
      if (kDebugMode) {
        print("Error generating summary: $error");
      }
    }
    return [];
  }

  void evaluateAnswers() {
    correctAnswers = 0;
    incorrectAnswers = 0;
    for (int i = 0; i < questions.length; i++) {
      String? selectedAnswer = selectedAnswers[i];
      if (selectedAnswer == questions[i].answer) {
        correctAnswers++;
      } else {
        incorrectAnswers++;
      }
    }
  }

  void resetQuiz() {
    questions.clear();
    selectedAnswers.clear();
    correctAnswers = 0;
    incorrectAnswers = 0;
  }

  Future<void> saveQuizToFirestore() async {
    try {
      await firestore.collection('users').doc(auth.user!.uid).collection('quizHistory').add({
        'subject': subjectController.text,
        'topic': topicController.text,
        'questions': questions.map((q) => q.toJson()).toList(),
        'selectedAnswers': selectedAnswers.map((key, value) => MapEntry(key.toString(), value)),
        'timestamp': FieldValue.serverTimestamp(),
      });
      AppUtils.showSuccess('Quiz saved to Firestore');
      if (kDebugMode) {
        print('Quiz saved to Firestore');
      }
    } catch (e) {
      AppUtils.showError('Error saving quiz to Firestore: $e');
      if (kDebugMode) {
        print('Error saving quiz to Firestore: $e');
      }
    }
  }
   List<String> shuffleAnswers(QuizQuestion question, int questionIndex) {
    List<String> allOptions = List.from(question.incorrectAnswers)
      ..add(question.answer);
    allOptions.shuffle();
    return allOptions;
}
}
extension on QuizQuestion {
  Map<String, dynamic> toJson() {
    return {
      'question': question,
      'answer': answer,
      'incorrect_answers': incorrectAnswers,
    };
  }
}
