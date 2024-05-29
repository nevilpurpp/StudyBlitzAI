import 'package:flutter/material.dart';

import '../../../data/providers/base_view.dart';
import '../../../data/providers/viewmodel/auth_view_model.dart';
import '../../../routes/routes.dart';
import '../../widgets/common_text_form_field.dart';

class RegisterScreen extends StatelessWidget {
   RegisterScreen({super.key});
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
        body: buildRegistrationPage(context) ,
      ),
    ));
      }
    );
  }
  Widget buildRegistrationPage(BuildContext context){
    return  SingleChildScrollView(
    child: Form(child: 
    Column(
      children: [
        const Text('Hello There!!',
         style: TextStyle(
          fontSize: 25, 
        fontWeight: FontWeight.bold
        ),),
        const Text("Let's Get started", 
        style: TextStyle(
          fontSize: 25, 
        fontWeight: FontWeight.bold
        ),),
        const SizedBox(height: 10,),
        //name
         CommonTextFormField(
         prefixIconWidget: const Icon(Icons.person),
        controller: model!.nameController,
        hintTextWidget: 'Enter Your Username',
      ),
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
        //suffixIconWidget: I,
      ),
      const SizedBox(height: 10,),
      //elevated button,
      SizedBox(
        width: 300,
        child: ElevatedButton(
          onPressed: ()async{
          String name = model!.nameController.text;  
          String email = model!.emailController.text;
          String password = model!.passwordController.text;
        
          // Perform validation 
          if (name.isEmpty||email.isEmpty || password.isEmpty) {
            // Show error message
            return;
          }
        
          // Call registerWithEmailAndPassword
          final credential = await model!.registerWithEmailAndPassword( name, email, password);
          if (credential != null) {
            // Handle successful login (navigate to home?)
            // ignore: use_build_context_synchronously
            Navigator.pushNamed(context, Routes.homeRoute);
          } else {
            // Handle login errors
          }
          },
         child: const Text('Register')),
      ),
       //sign in with google
       OutlinedButton(onPressed: ()async{
        final credential = await model!.signInWithGoogle();
        if(credential != null){
          Navigator.pushNamed(context, Routes.homeRoute);
        }
       },
        child: const Text('SignUp with google')),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Already have an account?'),
            GestureDetector(
              onTap: (){
            Navigator.pushNamed(context, Routes.loginRoute);
              },
              child: const Text('SignIn',
              style: TextStyle(fontWeight: FontWeight.bold)),
              )
          ],
        ),
        
      ],
    )),
   );
  }
}