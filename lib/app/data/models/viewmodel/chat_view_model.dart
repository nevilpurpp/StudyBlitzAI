import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import '../../middleware/api_services.dart';
import '../chat_model.dart';
import 'base_model.dart';

class ChatViewModel extends BaseModel {
  TextEditingController messageController = TextEditingController();
  ScrollController scrollController = ScrollController();
  GoogleGenerativeServices generativeServices = GoogleGenerativeServices();

  File? _photo;
  ImagePicker? _imagePicker=ImagePicker();
  String? _fileName;
  List<ChatModel> chatList = [];
  bool? _isTyping;
  bool? _isEmojiPicker;

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

    updateUI();
  }

  showEmojiPicker(bool value) {
    setEmojiPicker = value;
    updateUI();
  }

  scrollMessages() {
    scrollController.animateTo(scrollController.position.maxScrollExtent + 120,
        duration: const Duration(milliseconds: 5), curve: Curves.easeOut);
  }

  getChat() async {
    File? image = photo;
    log(image.toString());
    chatList.add(ChatModel(
        role: 'user',
        text: messageController.text,
        photo: image));
    scrollMessages();
    updateUI();
    setPhoto = null;
    chatList.add(ChatModel(role: 'model', text: '', photo: null));
    scrollMessages();
    updateUI();

    int index = chatList.length - 1;
    if (image != null) {
      final chatData = await generativeServices.getTextFromImage(
          image, messageController.text);
      chatList.removeAt(index);
      chatList.add(ChatModel(
        role: chatData?.role ?? '',
        text: chatData?.text ?? '',
      ));
    } else {
      String data = await generativeServices.getText(messageController.text);
      chatList.removeAt(index);
      chatList.add(ChatModel(text: data, role: 'model'));
      updateUI();
    }
    scrollMessages();
    updateUI();
  }
}
