import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nevilai/app/data/providers/viewmodel/onboarding_view_model.dart';
import '../../../data/providers/base_view.dart';

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
                    onPressed: () {
                      // Handle skip action
                    },
                    child: const Text('Skip'),
                  ),
                ),
                PageView.builder(
                  itemCount: model.demoData.length,
                  scrollDirection: Axis.horizontal,
                  onPageChanged: (index) {
                    model.setCurrentPage(index);
                  },
                  itemBuilder: (context, index) {
                    final data = model.demoData[index];
                    return Column(
                      children: [
                        const SizedBox(height: 50),
                        SvgPicture.asset(data.image),
                        const SizedBox(height: 30),
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
                        child: ElevatedButton(
                          onPressed: () {
                            // Handle get started action
                          },
                          child: const Text('Get Started'),
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
                                    ? Colors.black
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
