import 'package:flutter/material.dart';
import 'package:nevilai/app/ui/screens/explain_topic_screen/topic_summarizer.dart';
import 'package:nevilai/app/ui/screens/home/home_page.dart';
import '../ui/screens/chat_screen/chat_screen.dart';
import 'routes.dart';

class PageRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homeRoute:
          return MaterialPageRoute(builder: (context) => const HomePage());
      case Routes.profileRoute:
          return MaterialPageRoute(builder: (context) => const HomePage());
      case Routes.topicRoute:
          return MaterialPageRoute(builder: (context) =>  TopicScreen());
      case Routes.examRoute:
          return MaterialPageRoute(builder: (context) => const HomePage());
      case Routes.chatRoute:
        return MaterialPageRoute(builder: (context) => ChatScreen());


      default:
        return MaterialPageRoute(
            builder: (BuildContext conktext) => const Scaffold(
                  body: Text('This Page does not Exist'),
                ));
    }
  }
}
