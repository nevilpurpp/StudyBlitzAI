import 'package:flutter/material.dart';

import 'home/home_page.dart';



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

