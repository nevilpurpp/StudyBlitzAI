import 'package:flutter/material.dart';
import 'package:nevilai/app/ui/screens/chat_screen/chat_widget/chat.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat with Nevi'),
        centerTitle: true,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        },
         icon: const Icon(Icons.arrow_back_ios_outlined)),
      ),
      body: const SectionChat(),
    );
  }
}