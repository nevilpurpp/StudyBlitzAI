import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';

import 'pages/home_page.dart';
import 'themes/theme.dart';

void main() {
   Gemini.init(apiKey: 'AIzaSyDmyjxNXMn9zuQW4Y1DpGmjr2LnY-SI2C0', enableDebugging: true);
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
      theme: MyAppThemes.lightColorScheme,      
      darkTheme: MyAppThemes.darkColorScheme,
     
      home: const MyHomePage(),
    );
  }
}

