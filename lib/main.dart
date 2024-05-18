import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'app/data/middleware/api.dart';
import 'app/ui/screens/home/home_page.dart';


void main() {
   Gemini.init(apiKey: '$geminiApiKey ', enableDebugging: true);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light
      ),      
      darkTheme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark
      ),
     
      home: const HomePage(),
    );
  }

}
//login 
//save user session

