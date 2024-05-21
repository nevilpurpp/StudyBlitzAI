import 'dart:io';

class ChatModel {
  String text;
  String? role;
  File? photo;
  
  ChatModel({
  this.photo, 
  this.role, 
  required this.text
  });
}