import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:nevilai/app/core/constants/assets_constant.dart';
import 'package:nevilai/app/data/hive_adapter/user_history.dart';
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
            _buildMainButtonsSection(),
            _buildHistorySection(),
            Expanded(child: _buildHistory()),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      toolbarHeight: 40,
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
          const Text('Nevi Virtual Assistant'),
        ],
      ),
      automaticallyImplyLeading: false,
      centerTitle: true,
    );
  }

  Widget _buildWelcomeSection() {
    return SizedBox(
      height: 200,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 1),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, Routes.profileRoute);
                  },
                  child: authViewModel.userphoto != null
                      ? CircleAvatar(
                          backgroundImage:
                              NetworkImage(authViewModel.userphoto),
                        )
                      : const SizedBox(
                          height: 50,
                          width: 50,
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            backgroundImage: AssetImage(AssetConstant.profileIcon),
                          ),
                        ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                      ' Hello, ${authViewModel.username ?? 'Welcome!'}',
                      style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const Text(
              'Ace your exams\nwith the ultimate study buddy,',
                style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white60,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMainButtonsSection() {
    return SizedBox(
      height: 340,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
                    color: const Color(0xFFC09FF8),
                    isMainButton: false,
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.examRoute);
                    },
                  ),
                  const SizedBox(height: 8),
                  CustomCard(
                    title: 'Topic\nSummarizer',
                    imagePath: AssetConstant.topicIcon,
                    color: const Color(0xFFFEC4DD),
                    isMainButton: false,
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.topicRoute);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHistorySection() {
    return const Row(
      children: [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'History',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Spacer(),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'See all',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildHistory() {
    return FutureBuilder(
      future: Hive.openBox<UserHistory>('historyBox'),
      builder: (context, AsyncSnapshot<Box<UserHistory>> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final historyBox = snapshot.data!;
            return ValueListenableBuilder(
              valueListenable: historyBox.listenable(),
              builder: (context, Box<UserHistory> box, _) {
                if (box.values.isEmpty) {
                  return const Center(child: Text('No history found.'));
                }

                return ListView.builder(
                  itemCount: box.length,
                  itemBuilder: (context, index) {
                    final history = box.getAt(index);
                    return ListTile(
                      title: Text(history?.action ?? ''),
                      subtitle: Text(history?.timestamp.toString() ?? ''),
                    );
                  },
                );
              },
            );
          }
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
