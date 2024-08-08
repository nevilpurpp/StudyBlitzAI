import 'package:flutter/material.dart';
import 'package:nevilai/app/routes/routes.dart';
import 'package:nevilai/app/ui/screens/splash_screen/splash_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../core/theme/font.dart';
import '../core/theme/theme.dart';
import '../data/providers/viewmodel/theme_model.dart';
import '../routes/router.dart';
import 'screens/auth_screen/auth_screen.dart';
import 'screens/onboarding_screen/onboard_screen.dart';



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeModel>(
      builder: (context, model, child) {
        TextTheme textTheme = createTextTheme(context, "Roboto Mono", "Open Sans");
        MaterialTheme theme = MaterialTheme(textTheme);
        
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: model.themeMode,
          theme: theme.light(),
          darkTheme: theme.dark(),
          onGenerateRoute: PageRouter.generateRoute,
          initialRoute: Routes.splashRoute,
          home: const SplashScreen(),
        );
      },
    );
  }
}
//login 
//save user session
class InitialScreen extends StatelessWidget {
  const InitialScreen({super.key});

  Future<bool> checkOnboardingStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('onboardingComplete') ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: checkOnboardingStatus(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return const Center(child: Text('Error loading app'));
        } else {
          bool onboardingComplete = snapshot.data ?? false;
          return onboardingComplete ? AuthStateScreen() : const Onboardscreen();
        }
      },
    );
  }
}
