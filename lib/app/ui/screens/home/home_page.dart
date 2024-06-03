import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nevilai/app/core/constants/assets_constant.dart';
import 'package:nevilai/app/data/providers/viewmodel/auth_view_model.dart';
import 'package:nevilai/app/ui/screens/home/home_widget/app_bar.dart';
import 'package:nevilai/app/ui/screens/home/home_widget/custom_card.dart';
import '../../../routes/routes.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}
final authViewModel = AuthViewModel();
class _HomePageState extends State<HomePage> {
  AuthViewModel currentuser = AuthViewModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            
            SizedBox(
            height: 200,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child:  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 30,),
                  Row(children: [
                     Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text('Hello, ${authViewModel.username ?? 'Welcome!'}',
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                                
                    )),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: (){
                      Navigator.pushNamed(context, Routes.profileRoute);
                    },
                    child: authViewModel.userphoto != null
                    ? CircleAvatar(backgroundImage: NetworkImage(authViewModel.userphoto),)
                    : const SizedBox(
                       height: 50,
                       width: 50,
                      child: CircleAvatar(
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage(AssetConstant.profileIcon),),
                         ), 
        
                  //IconButton(onPressed: (){}, icon: const Icon(Icons.person_2_rounded))
              )],),
                  
                  const Text('Ace your exams\nwith the ultimate study buddy,',
                  style: TextStyle(fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white60
                  ),)
              
                ],
              ),
            ),
            ),
            SizedBox(
              height: 340,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:    [
                    
                     Expanded(
                       child: CustomCard(
                                 title: 'Chat\nwith AI', 
                                  imagePath: AssetConstant.chatIcon,
                        color: const Color(0xFFC5F432), 
                        isMainButton: true,
                         onPressed: () { 
                          Navigator.pushNamed(context, Routes.chatRoute);
                          },
                        
                               ),
                     ),
                    
                      Expanded(
                        child: Column(
                          children: [
                             CustomCard(
                        title: 'Exam\nPreparation', 
                        imagePath: AssetConstant.examprepIcon,
                          color: Color(0xFFC09FF8), 
                        isMainButton: false,
                         onPressed: () { 
                          Navigator.pushNamed(context, Routes.examRoute);
                          },
                        
                        ),
                            const SizedBox(height: 8),             
                      CustomCard(
                        title: 'topic\nSummarizer', 
                        imagePath: AssetConstant.topicIcon,
                        color: Color(0xFFFEC4DD), 
                        isMainButton: false,
                         onPressed: () { 
                          Navigator.pushNamed(context, Routes.topicRoute);
                          },
                        
                        ),
                          ],
                        ),
                      )
                
                  ],
                  ),
              ),
            ),
            const Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('History',style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600
                  ),),
                ),
                Spacer(),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('see all',style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600
                  ),),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}