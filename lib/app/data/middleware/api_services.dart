
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:nevilai/app/core/utils/utils.dart';
import 'package:nevilai/app/data/middleware/api.dart';
import '../models/chat_model.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
class GoogleGenerativeServices {
  Future<String> getText(String message) async {
    String result = '';
    try {
      final model =
          GenerativeModel(
            model: 'gemini-1.5-flash', 
          apiKey: geminiApiKey,
          requestOptions: const RequestOptions());
      final prompts = message;
      final content = [Content.text(prompts)];
      final response = await model.generateContent(content);
      content.first.role;

      result = response.text ?? '';
      return result;
    } catch (e) {
      if (e is SocketException){
       AppUtils.showError('No Internet Connection. Please try again later $e');
       log("No Internet Connection. Please try again later $e");
    }
    else{
      AppUtils.showError('An unknown error occurred: $e');
    }
    }
    return '';
  }

  
 Future<List<Map<String, dynamic>>> getquiz(String message) async {
  try {
    final model = GenerativeModel(
      model: 'gemini-1.5-flash',
      apiKey: geminiApiKey,
     // generationConfig: GenerationConfig(responseMimeType: 'application/json'),
    );
    final prompts = message;
    final content = [Content.text(prompts)];
    final response = await model.generateContent(content,
    generationConfig: GenerationConfig(
      topP: 1,
      temperature: 0,
      maxOutputTokens: 10000,
      responseMimeType: 'application/json'),);
   final result = response.text!;
   
    // Decode the JSON response
    final jsonResponse = jsonDecode(result.toString()) as List<dynamic>;

    return jsonResponse.map((item) => item as Map<String, dynamic>).toList();
  } catch (e) {
    if (e is SocketException){
       AppUtils.showError('No Internet Connection. Please try again later $e');
       log("No Internet Connection. Please try again later $e");
    }
    else{
      AppUtils.showError('An unknown error occurred: $e');
    }
   
    
    rethrow;
  }
}

 
 
  Future<ChatModel?> getTextFromImage(File photo, String message) async {
    try {
      final model = GenerativeModel(
          model: 'gemini-1.5-flash', apiKey: geminiApiKey,
          );

      final prompt = TextPart(message);
      final imageParts = [
        DataPart('image/jpeg', await photo.readAsBytes()),
      ];
      final response = await model.generateContent([
        Content.multi([prompt, ...imageParts])
      ]);
      log(response.text.toString());
      return ChatModel(
          role: response.candidates.first.content.role.toString(),
          text: response.text.toString());
    } catch (e) {
     if (e is SocketException){
       AppUtils.showError('No Internet Connection. Please try again later $e');
       log("No Internet Connection. Please try again later $e");
    }
    else{
      AppUtils.showError('An unknown error occurred: $e');
    }
    }
    return null;
  }
}