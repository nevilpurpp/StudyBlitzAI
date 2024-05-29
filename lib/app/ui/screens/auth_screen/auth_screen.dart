import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nevilai/app/data/providers/viewmodel/auth_view_model.dart';
import 'package:nevilai/app/ui/screens/auth_screen/login_screen.dart';
import 'package:nevilai/app/ui/screens/home/home_page.dart';

class AuthStateScreen extends StatelessWidget {
   AuthStateScreen({super.key});
   final authViewModel = AuthViewModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<User?>(
          stream: authViewModel.userState,
          builder: (context, snapshot) {
          if (snapshot.hasData){
            return const  HomePage();
          }
          else{
            return LoginScreen();
          }
          
        },
        ) 
    );
  }
}