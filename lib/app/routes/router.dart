import 'package:flutter/material.dart';
import 'package:nevilai/app/ui/screens/auth_screen/auth_screen.dart';
import 'package:nevilai/app/ui/screens/auth_screen/login_screen.dart';
import 'package:nevilai/app/ui/screens/auth_screen/register_screen.dart';
import 'package:nevilai/app/ui/screens/explain_topic_screen/topic_summarizer.dart';
import 'package:nevilai/app/ui/screens/home/home_page.dart';
import 'package:nevilai/app/ui/screens/profile/profile_screen.dart';
import '../ui/screens/chat_screen/chat_screen.dart';
import 'routes.dart';

class PageRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.authRoute:
            return MaterialPageRoute(builder: (context) => AuthStateScreen());
      case Routes.homeRoute:
          return MaterialPageRoute(builder: (context) => const HomePage());
      case Routes.profileRoute:
          return MaterialPageRoute(builder: (context) => ProfileScreen());
      case Routes.topicRoute:
          return MaterialPageRoute(builder: (context) =>  TopicScreen());
      case Routes.examRoute:
          return MaterialPageRoute(builder: (context) => const HomePage());
      case Routes.chatRoute:
        return MaterialPageRoute(builder: (context) => ChatScreen());
      case  Routes.loginRoute:
        return MaterialPageRoute(builder: (context) => LoginScreen());  
       case Routes.registerRoute:
         return MaterialPageRoute(builder: (context) => RegisterScreen());

      default:
        return MaterialPageRoute(
            builder: (BuildContext conktext) => const Scaffold(
                  body: Text('This Page does not Exist'),
                ));
    }
  }
}
