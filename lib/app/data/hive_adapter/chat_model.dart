import 'dart:io';
import 'package:hive/hive.dart';

part 'chat_model.g.dart';

@HiveType(typeId: 0)
class ChatModel extends HiveObject {
  @HiveField(0)
  final String role;
  
  @HiveField(1)
  final String text;
  
  @HiveField(2)
  final File? photo;

  ChatModel({required this.role, required this.text, this.photo});
}
