import 'package:flutter/material.dart';
import 'package:nevilai/app/core/constants/assets_constant.dart';
import 'package:nevilai/app/data/providers/viewmodel/auth_view_model.dart';
import 'package:nevilai/app/ui/screens/home/home_widget/custom_card.dart';
import '../../../routes/routes.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

final authViewModel = AuthViewModel();

class _HomePageState extends State<HomePage> {
  final AuthViewModel currentuser = AuthViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SafeArea(
        child: Column(
          children: [
            _buildWelcomeSection(),
            const SizedBox(height: 40,),
            _buildMainButtonsSection(),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      toolbarHeight: 40,
      /*
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            AssetConstant.applogo,
            fit: BoxFit.contain,
            height: 30,
            width: 30,
          ),
          const SizedBox(width: 10),
          //const Text('Study Blitz'),
        ],
      )*/
      automaticallyImplyLeading: false,
      centerTitle: true,
      actions:[
        Padding(
          padding: const EdgeInsets.fromLTRB(5, 5, 13, 5),
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, Routes.settingsRoute);
            },
            child: Image.asset(AssetConstant.settingsIcon,
            color: Theme.of(context).brightness == Brightness.dark
           ? Colors.white70
            : Colors.grey,
            ),
          ),
        )
      ]
    );
  }

  Widget _buildWelcomeSection() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.1),
        borderRadius: BorderRadius.circular(24),
      ),
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              //Navigator.pushNamed(context, Routes.profileRoute);
            },
            child: Row(
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundImage: authViewModel.userphoto != null
                      ? NetworkImage(authViewModel.userphoto) as ImageProvider
                      : const AssetImage(AssetConstant.profileIcon) as ImageProvider,
                  backgroundColor:  Theme.of(context).brightness == Brightness.dark
                  ? Colors.white70
                  : Colors.black,
            
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'Hello, ${authViewModel.username ?? 'Welcome!'}',
                    style:  TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                       color: Theme.of(context).brightness == Brightness.dark
                    ? Colors.white70
                    : Colors.black,
            ),
                    
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
           Text(
            'Ace your exams with the ultimate study buddy.',
            style: TextStyle(
              fontSize: 16,
             color: Theme.of(context).brightness == Brightness.dark
      ? Colors.white70
      : Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMainButtonsSection() {
    return SizedBox(
      height: 550,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(13.0),
              child: CustomCard(
                title: 'Exam Preparation',
                imagePath: AssetConstant.examprepIcon,
                color: const Color(0xFFC09FF8),
                isMainButton: false,
                onPressed: () {
                  Navigator.pushNamed(context, Routes.examRoute);
                },
              ),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.all(13.0),
              child: CustomCard(
                title: 'Chat with AI',
                imagePath: AssetConstant.chatIcon,
                color: const Color(0xFFC5F432),
                isMainButton: false,
                onPressed: () {
                  Navigator.pushNamed(context, Routes.chatRoute);
                },
              ),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.all(13.0),
              child: CustomCard(
                title: 'Topic Summarizer',
                imagePath: AssetConstant.topicIcon,
                color: const Color(0xFFFEC4DD),
                isMainButton: false,
                onPressed: () {
                  Navigator.pushNamed(context, Routes.topicRoute);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
