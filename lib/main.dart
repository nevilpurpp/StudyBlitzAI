import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'app/core/theme/my_app_theme.dart';
import 'app/ui/screens/home/home_page.dart';


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
      theme: MyAppThemes.lightTheme,      
      darkTheme: MyAppThemes.darkTheme,
     
      home: const HomePage(),
    );
  }
}
//login 
//save user session

