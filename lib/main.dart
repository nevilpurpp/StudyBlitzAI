import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'app/ui/screens/home/home_page.dart';


void main() {
   Gemini.init(apiKey: 'ENTER_YOUR_API_KEY', enableDebugging: true);
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
      //theme: MyAppThemes.lightColorScheme,      
      //darkTheme: MyAppThemes.darkColorScheme,
     
      home: const HomePage(),
    );
  }
}
//login 
//save user session

