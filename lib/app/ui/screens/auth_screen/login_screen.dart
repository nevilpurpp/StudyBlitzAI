// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nevilai/app/core/constants/assets_constant.dart';
import 'package:nevilai/app/data/providers/viewmodel/auth_view_model.dart';
import 'package:nevilai/app/ui/widgets/common_text_form_field.dart';
import '../../../core/utils/utils.dart';
import '../../../data/providers/base_view.dart';
import '../../../routes/routes.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
   LoginScreen({super.key});
  AuthViewModel? model;
  @override
  Widget build(BuildContext context) {
    return   BaseView<AuthViewModel>(
      onModelReady: (model) {
        this.model = model;
      },
      builder: (context, model, child) {
        return SafeArea(child: 
    GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
        model.keyboard(false);
      },
      child: Scaffold(
        body: buildLoginPage(context) ,
      ),
    ));
      }
    );
  }
  Widget buildLoginPage(BuildContext context){
   return  SingleChildScrollView(
    child: Form(child: 
    Column(
      children: [
        const SizedBox(height: 20,),
        SizedBox(
        height: 100,
        width: 100,
          child: Image.asset(AssetConstant.bookIcon,
          color: Colors.blue ,
          fit: BoxFit.contain),
        ),
       const  SizedBox(height: 20,),
        const Text('Welcome Back!!',
         style: TextStyle(
          fontSize: 25, 
        fontWeight: FontWeight.bold
        ),),
        const Text('we missed you', 
        style: TextStyle(
          fontSize: 25, 
        fontWeight: FontWeight.bold
        ),),
        const SizedBox(height: 10,),
      //email
      CommonTextFormField(
         prefixIconWidget: const Icon(Icons.email),
        controller: model!.emailController,
        hintTextWidget: 'Enter Your Email',
      ),
      const SizedBox(height: 10,),
      //password
       CommonTextFormField(
        prefixIconWidget: const Icon(Icons.password),
        controller: model!.passwordController,
        hintTextWidget: 'Enter Your Password',
        obsocuringCharacter: '*',
        obscureText: true,
        maxLines: 1,
        //suffixIconWidget: I,
      ),
      const SizedBox(height: 10,),
      //elevated button,
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: 45,
          width: 300,
          child: ElevatedButton(
            onPressed: ()async{
              
            String email = model!.emailController.text;
            String password = model!.passwordController.text;
          
            // Perform validation (optional)
            if ( email.isEmpty || password.isEmpty) {
              // Show error message
              AppUtils.showError('Input Your Details');
              return;
            }
          
            // Call registerWithEmailAndPassword
            final credential = await model!.signInWithEmailAndPassword( email, password);
            if (credential != null) {
              // Handle successful login (navigate to home?)
              // ignore: duplicate_ignore
              // ignore: use_build_context_synchronously
              Navigator.pushNamed(context, '/home');
            } else {
              // Handle login errors
            }
            },
           child: const Text('Login')),
        ),
      ),
       //sign in with google
       Padding(
         padding: const EdgeInsets.all(8.0),
         child: SizedBox(
          height: 45,
          width: 300,
           child: OutlinedButton(onPressed: ()async{
            final credential = await model!.signInWithGoogle();
            if(credential != null){
              Navigator.pushNamed(context, '/home');
            }
           },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(height: 40,
                  width:40,
                    child: Image.asset(AssetConstant.googleIcon,
                    fit: BoxFit.contain),
                  ),
                ),
                const Text('SignIn with google'),
              ],
            )),
         ),
       ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Dont have an account?'),
              GestureDetector(
                onTap: (){
           Navigator.pushNamed(context, Routes.registerRoute);
                },
                child: const Text('Signup',
                style: TextStyle(fontWeight: FontWeight.bold)),
                )
            ],
          ),
        ),
        
      ],
    )),
   );
  }
 
}