import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nevilai/app/data/providers/viewmodel/base_model.dart';
import 'package:nevilai/app/data/providers/viewmodel/chat_view_model.dart';

import '../../../core/utils/utils.dart';
import '../../middleware/api_services.dart';

class TopicSummarizerView extends BaseModel{
  TextEditingController topicController = TextEditingController();
  TextEditingController subjectController = TextEditingController();
   GoogleGenerativeServices generativeServices = GoogleGenerativeServices();


     String? topic;
   String? subject;
  String? difficulty;
   String summary = '';

   keyboard(bool value){
    Function(bool value) keyboard = ChatViewModel().keyboardAppear;
    return keyboard;
  }
 
  
  String constructPrompt(){
   String topic = topicController.text;
    String subject = subjectController.text;
   String prompt = 'Give a summary based on the topic: $topic, subject/unit: $subject, and level of difficulty: $difficulty.';


    return prompt;
  }

  Future<void> summarizeTopic() async {
  try {
    final String summaryText = await generativeServices.getText(constructPrompt());
    summary = summaryText;
    updateUI(); // Update UI with the retrieved summary
    notifyListeners();
    
  } catch (error) {
    // Handle potential errors during API call
    AppUtils.showError('$error');
    if (kDebugMode) {
      print("Error generating summary: $error");
    }
  }
}


}