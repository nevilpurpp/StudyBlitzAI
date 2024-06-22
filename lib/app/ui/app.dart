import 'package:flutter/material.dart';
import 'package:nevilai/app/routes/routes.dart';
import '../core/theme/font.dart';
import '../core/theme/theme.dart';
import '../routes/router.dart';
import 'screens/home/home_page.dart';



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
      final brightness = View.of(context).platformDispatcher.platformBrightness;

    // Retrieves the default theme for the platform
    //TextTheme textTheme = Theme.of(context).textTheme;

    // Use with Google Fonts package to use downloadable fonts
    TextTheme textTheme = createTextTheme(context, "Roboto Mono", "Open Sans");
    MaterialTheme theme = MaterialTheme(textTheme);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: brightness == Brightness.light ? theme.light() : theme.dark(),      
   
     onGenerateRoute: PageRouter.generateRoute,
     initialRoute: Routes.authRoute,
      home: const HomePage(),
    );
  }

}
//login 
//save user session

