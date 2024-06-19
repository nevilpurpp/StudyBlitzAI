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
GoogleGenerativeServices generativeServices = GoogleGenerativeServices();
FirebaseFirestore firestore = FirebaseFirestore.instance;
AuthViewModel auth = AuthViewModel();

  String? topic;
  String? subject;
  late final String username;
  //String? difficulty;
   List<QuizQuestion> questions = [];
  Map<int, String?> selectedAnswers = {};
  int correctAnswers = 0;
  int incorrectAnswers = 0;

  keyboard(bool value){
  Function(bool value) keyboard = ChatViewModel().keyboardAppear;
  return keyboard;
  }

String constructPrompt(){
   String topic = topicController.text;
    String subject = subjectController.text;
   return  '''
    You will be given a subject and a topic. Your aim is to generate questions and answers in a list dictionary.
    the questions are mutliple choice, so you will generate the question, the answer and 3 incorrect answers.
    Here is an example of how your response should look like.
   [
  {
    "question": "What is biology?",
    "answer": "It is the study of living organisms",
    "incorrect_answers": ["It is study of animals", "Study of soil", "Study of marine life", "Eating of animals"]
  },
  {
    "question": "What is mathematics?",
    "answer": "It is the study of numbers, shapes, and quantities",
    "incorrect_answers": ["It is study of animals", "Study of soil", "Study of marine life", "Eating of animals"]
  }
]

     the subject is $subject, topic is $topic
     just output what is expected, don't add any introduction
    ''';


   
  }

  Future<List> generateQuestions()async {
    try{
         final questionsResponse = await generativeServices.getquiz(constructPrompt());
      questions = questionsResponse.map((item) => QuizQuestion.fromJson(item)).toList();
  
    updateUI(); // Update UI with the retrieved summary
    notifyListeners();
    return questions;
       } catch(error){
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
   /*
   if (auth == null || auth!.user == null || auth!.user.uid == null) {
    print('User authentication data is not available.');
    return;
  }*/
    try {
      await firestore.collection('users').doc(auth.user.uid).collection('quizHistory').add({
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

class FirestoreService {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> saveQuizToFirestore({
    required String username,
    required String subject,
    required String topic,
    required List<Map<String, dynamic>> questions,
    required Map<String, String?> selectedAnswers,
  }) async {
    try {
      await firestore.collection(username).doc().collection('quizHistory').add({
        'subject': subject,
        'topic': topic,
        'questions': questions,
        'selectedAnswers': selectedAnswers,
        'timestamp': FieldValue.serverTimestamp(),
      });
      print('Quiz saved to Firestore');
    } catch (e) {
      print('Error saving quiz to Firestore: $e');
    }
  }
}
