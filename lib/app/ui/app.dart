import 'package:flutter/material.dart';
import 'package:nevilai/app/routes/routes.dart';
import '../routes/router.dart';
import 'screens/home/home_page.dart';



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
     onGenerateRoute: PageRouter.generateRoute,
     initialRoute: Routes.homeRoute,
      home: const HomePage(),
    );
  }

}
//login 
//save user session

