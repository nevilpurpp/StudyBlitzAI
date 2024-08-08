import 'package:firebase_core/firebase_core.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'app/data/hive_adapter/chat_model.dart';
import 'app/data/hive_adapter/user_history.dart';
import 'app/data/providers/viewmodel/theme_model.dart';
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
  await Hive.openBox<ChatModel>('chatBox');
  //await Hive.openBox('quizHistory');
 // await Hive.openBox<UserHistory>('historyBox');
  await setUpLocator();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => locator<ThemeModel>()),
      ],
      child: const MyApp(),
    ),
  );
}
