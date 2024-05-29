import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nevilai/app/data/providers/viewmodel/auth_view_model.dart';
import 'package:nevilai/app/ui/screens/auth_screen/login_screen.dart';
import 'package:nevilai/app/ui/screens/home/home_page.dart';
import '../../../core/utils/utils.dart';

class AuthStateScreen extends StatelessWidget {
   AuthStateScreen({super.key});
final authViewModel = AuthViewModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: authViewModel.userState,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator()); // Loading indicator
          } else if (snapshot.hasError) {
            return Center(child: AppUtils.showError('Error: ${snapshot.error}')); // Handle errors (optional)
          } else {
            return snapshot.hasData ? const HomePage() : LoginScreen();
          }
        },
      ),
    );
  }
}
