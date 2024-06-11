import 'package:flutter/material.dart';

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
  var questions = [];
    keyboard(bool value){
    Function(bool value) keyboard = ChatViewModel().keyboardAppear;
    return keyboard;
  }

String constructPrompt(){
   String topic = topicController.text;
    String subject = subjectController.text;
   String prompt = '''
    You will be given a subject and a topic. Your aim is to generate questions and answers in a list dictionary.
    the questions are mutliple choice, so you will generate the question, the answer and 3 incorrect answers.
    Here is an example of how your response should look like.
    [
    {"question" : "what is biology?"},
    {"answer" : "it is the study of living organisms"},
    {"incorrect_answers" : [
    "it is study of animals", "study of soil" , "study of marine life", "eating of animals"]}]
     the subject is $subject, topic is $topic
     just output what is expected, don't add any introduction
    ''';


    return prompt;
  }

  Future<void> generateQuestions()async {
    
  }

}