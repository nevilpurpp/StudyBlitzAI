import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nevilai/app/data/models/quiz_question_model.dart';
import '../../../core/utils/utils.dart';
import '../../middleware/api_services.dart';
import 'base_model.dart';
import 'chat_view_model.dart';

class ExamPrepViewModel extends BaseModel {

TextEditingController topicController = TextEditingController();
TextEditingController subjectController = TextEditingController();
GoogleGenerativeServices generativeServices = GoogleGenerativeServices();

  String? topic;
  String? subject;
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
}