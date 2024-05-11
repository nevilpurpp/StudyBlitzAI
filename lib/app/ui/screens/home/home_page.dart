import 'package:flutter/material.dart';
import 'package:nevilai/app/ui/screens/home/home_widget/custonCard.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 5,
        crossAxisSpacing: 10,
        children:    [
          Card.filled( 
            child:CustomCard(
            title: 'Chat', 
           image: 'assets/icons/chat.png'),
          ),
          Card.filled( 
            
            child: InkWell(
              splashColor: Colors.blue,
              onTap: (){
                debugPrint('Card tapped');
              },
              child: CustomCard(
                title: 'Generate Quiz', 
                image: 'assets/icons/ideas.png'),
            ),
              ),
          Card.filled(
             child: CustomCard(
              title: 'Essay Grader', 
              image: 'assets/icons/essay.png'),
              ),
          Card.filled( 
            child: CustomCard(
              title: 'Explain a topic', 
              image: 'assets/icons/trending-topic.png'),
              )

        ],
        ),
    );
  }
}