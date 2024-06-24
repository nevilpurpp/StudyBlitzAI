import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nevilai/app/data/providers/viewmodel/onboarding_view_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../data/providers/base_view.dart';
import '../../../routes/routes.dart';  // Ensure this path is correct

class Onboardscreen extends StatefulWidget {
  const Onboardscreen({super.key});

  @override
  State<Onboardscreen> createState() => _OnboardscreenState();
}

class _OnboardscreenState extends State<Onboardscreen> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive, overlays: []);
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive, overlays: []);
    super.dispose();
  }
  Future<void> completeOnboarding() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('onboardingComplete', true);
  }
  @override
  Widget build(BuildContext context) {
    return BaseView<OnboardingViewModel>(
      onModelReady: (model) {},
      builder: (context, model, child) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: TextButton(
                    onPressed: () async{
                      await completeOnboarding();
                      // Navigate to the authentication screen
                      Navigator.pushReplacementNamed(context, Routes.authRoute);
                    },
                    child: const Text('Skip'),
                  ),
                ),
                PageView.builder(
                  controller: model.pageController,
                  itemCount: model.demoData.length,
                  scrollDirection: Axis.horizontal,
                  onPageChanged: (index) {
                    model.setCurrentPage(index);
                  },
                  itemBuilder: (context, index) {
                    final data = model.demoData[index];
                    return Column(
                      children: [
                        SvgPicture.asset(data.image),
                        const SizedBox(height: 10),
                        Text(
                          data.title,
                          style: const TextStyle(fontSize: 35),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          data.description,
                          style: const TextStyle(color: Colors.grey, fontSize: 20),
                        ),
                        const Spacer(),
                      ],
                    );
                  },
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 2,
                        child: SizedBox(
                          height: 50,
                          width: 200,
                          child: ElevatedButton(
                            onPressed: () async {
                              if (model.currentPage == model.demoData.length - 1) {
                                await completeOnboarding();
                                Navigator.pushReplacementNamed(context, Routes.authRoute);
                              } else {
                                model.pageController.nextPage(
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeInOut,
                                );
                              }
                            },
                            child: Text(
                              model.currentPage == model.demoData.length - 1
                                  ? 'Get Started'
                                  : 'Next',
                              style: const TextStyle(fontSize: 15),
                            ),
                          ),
                        ),
                      ),
                      const Expanded(
                        flex: 1,
                        child: SizedBox(
                          width: 20,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            model.demoData.length,
                            (index) => AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              height: 5,
                              width: model.currentPage == index ? 15 : 5,
                              margin: const EdgeInsets.symmetric(horizontal: 5),
                              decoration: BoxDecoration(
                                color: model.currentPage == index
                                    ? Theme.of(context).colorScheme.primary
                                    : Colors.grey,
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
