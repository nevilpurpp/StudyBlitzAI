import 'package:flutter/material.dart';
import 'package:nevilai/app/core/constants/assets_constant.dart';
import 'package:nevilai/app/ui/screens/home/home_widget/app_bar.dart';
import 'package:nevilai/app/ui/screens/home/home_widget/custom_card.dart';

import '../chat_screen/chat_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: const HomeAppBar(),
      body: Column(
        children: [
         
          SizedBox(
            height: 450,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 5,
                crossAxisSpacing: 6,
                children:    [
                  Card.filled( 
                    elevation: 5,
                    child:InkWell(
                      splashColor: Color.fromARGB(255, 159, 218, 191),
                      onTap: (){
                         Navigator.push(
                          context,
                         MaterialPageRoute(builder: (context) =>  ChatScreen()),
                         );
                      },
                      child: const CustomCard(
                      title: 'Chat', 
                               image: AssetConstant.chatIcon),
                    ),
                  ),
                  Card.filled( 
                    elevation: 5,
                    child: InkWell(
                      splashColor: Colors.blue,
                      onTap: (){
                        debugPrint('Card tapped');
                      },
                      child: const CustomCard(
                        title: 'Generate Quiz', 
                        image: AssetConstant.quizIcon),
                    ),
                      ),
                  Card.filled(
                    elevation: 5,
                     child: InkWell(
                      splashColor: Colors.purpleAccent.shade200,
                      onTap: (){
                        debugPrint('Card tapped');
                      },
                       child: const CustomCard(
                        title: 'Essay Grader', 
                        image: AssetConstant.essayIcon),
                     ),
                      ),
                  Card.filled( 
                    elevation: 5,
                    child: InkWell(
                      splashColor: Colors.blue,
                      onTap: (){
                        debugPrint('Card tapped');
                      },
                      child: const CustomCard(
                        title: 'Explain a topic', 
                        image: AssetConstant.topicIcon),
                    ),
                      )
              
                ],
                ),
            ),
          ),
        ],
      ),
    );
  }
}