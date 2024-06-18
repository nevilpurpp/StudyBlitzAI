import 'package:firebase_core/firebase_core.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'app/data/hive_adapter/chat_model.dart';
import 'app/data/hive_adapter/quiz_history.dart';
import 'app/data/hive_adapter/user_history.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'app/core/di/locator.dart';
import 'app/ui/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
     options: DefaultFirebaseOptions.currentPlatform,
  );
  final appDocumentDirectory = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);
   Hive.registerAdapter(ChatModelAdapter());
  Hive.registerAdapter(UserHistoryAdapter());
  Hive.registerAdapter(QuizQuestionAdapter());
  Hive.registerAdapter(UserAnswerAdapter());
  await Hive.openBox<ChatModel>('chatBox');
  //await Hive.openBox('quizHistory');
 // await Hive.openBox<UserHistory>('historyBox');
  await setUpLocator();
  runApp(const MyApp());
}
