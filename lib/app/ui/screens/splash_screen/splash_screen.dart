import 'package:flutter/material.dart';

import '../../../core/constants/assets_constant.dart';
import '../../../routes/routes.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Simulate a time-consuming task (e.g., loading data) for the splash screen.
    // Replace this with your actual data loading logic.
    Future.delayed(
      const Duration(seconds: 4),
      () {
       Navigator.pushNamed(context, Routes.initialRoute);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
        height: 100,
        width: 100,
          child: Image.asset(AssetConstant.applogo,
          fit: BoxFit.contain),
        ),
          ],
        ),
      ),
    );
  }
}