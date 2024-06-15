import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import '../../hive_adapter/user_history.dart';
import '../../middleware/api_services.dart';
import '../../models/chat_model.dart';
import 'auth_view_model.dart';
import 'base_model.dart';

class ChatViewModel extends BaseModel {
  TextEditingController messageController = TextEditingController();
  ScrollController scrollController = ScrollController();
  GoogleGenerativeServices generativeServices = GoogleGenerativeServices();
  AuthViewModel auth = AuthViewModel();

  File? _photo;
  ImagePicker? _imagePicker=ImagePicker();
  String? _fileName;
  List<ChatModel> chatList = [];
  bool? _isTyping;
  bool? _isEmojiPicker;
  
  Box<ChatModel>? _chatBox;
  Box<UserHistory>? _historyBox;
  

    ChatViewModel() {
    _initializeHive();
  }

  bool? get isEmojiPicker => _isEmojiPicker;
  bool? get isTyping => _isTyping;
  // List<ChatModel> get chatList => _chatList;
  File? get photo => _photo;
  String? get fileName => _fileName;
  ImagePicker? get imagePicker => _imagePicker;

  set setImagePicker(ImagePicker setImagePicker) {
    _imagePicker =setImagePicker;
  }

  set setFileName(String setFileName) {
    _fileName = setFileName;
  }

  set setPhoto(File? setPhoto) {
    _photo = setPhoto;
  }

  set setEmojiPicker(bool setEmojiPicker) {
    _isEmojiPicker = setEmojiPicker;
  }

  set setTyping(bool setTyping) {
    _isTyping = setTyping;
  }

  // set setChatList(List<ChatModel> setChatList) {
  //   _chatList = setChatList;
  // }

  Future<void> _initializeHive() async {
    //_chatBox = Hive.box<ChatModel>('chatBox');
    //_historyBox = Hive.box<UserHistory>('historyBox');
    chatList = _chatBox?.values.toList() ?? [];
    updateUI();
  }
  
  Future imgFromDevice(ImageSource source) async {
    final pickedFile = await imagePicker?.pickImage(source: source);
    if (pickedFile != null) {
      setPhoto = File(pickedFile.path);
      setFileName = basename(photo?.path ?? "");
      updateUI();
    } else {
      debugPrint('No image selected.');
    }
  }

  keyboardAppear(bool value) {
    setTyping = value;

  }

  showEmojiPicker(bool value) {
    setEmojiPicker = value;
    updateUI();
  }

  scrollMessages() {
    scrollController.animateTo(scrollController.position.maxScrollExtent + 120,
        duration: const Duration(milliseconds: 5),
         curve: Curves.easeOut);
  }

  Future<void> getChat() async {
    final image = _photo;
    final userMessage = ChatModel(
      role: '${auth.username}',
      text: messageController.text,
      photo: image,
    );

    _addMessageToList(userMessage);

    final neviMessage = ChatModel(role: 'Nevi', text: '', photo: null);
    _addMessageToList(neviMessage);

    if (image != null) {
      final chatData = await generativeServices.getTextFromImage(image, messageController.text);
      _updateLastMessage(ChatModel(
        role: chatData?.role ?? 'Nevi',
        text: chatData?.text ?? '',
      ));
    } else {
      final data = await generativeServices.getText(messageController.text);
      _updateLastMessage(ChatModel(
        role: 'Nevi',
        text: data,
      ));
    }
  }

  void _addMessageToList(ChatModel message) {
    chatList.add(message);
    _chatBox?.add(message);
    scrollMessages();
    updateUI();
  }

    void _updateLastMessage(ChatModel message) {
    //chatList.removeLast();
    chatList.add(message);
    _chatBox?.putAt(_chatBox!.length - 1, message);
    scrollMessages();
    updateUI();
  }
    Future<void> updateHistory(String action) async {
    final historyEntry = UserHistory(timestamp: DateTime.now(), action: action);
    await _historyBox?.add(historyEntry);
  }
}
