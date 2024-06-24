import 'package:flutter/material.dart';

import '../../../core/constants/assets_constant.dart';
import '../../../data/providers/base_view.dart';
import '../../../data/providers/viewmodel/auth_view_model.dart';
import '../../../routes/routes.dart';
import '../../widgets/common_text_form_field.dart';

// ignore: must_be_immutable
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
        const SizedBox(height: 80,),
        SizedBox(
        height: 100,
        width: 100,
          child: Image.asset(AssetConstant.applogo,
          fit: BoxFit.contain),
        ),
       const  SizedBox(height: 20,),
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
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: 45,
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
              const Text('Already have an account?'),
              const SizedBox(width: 10,),
              GestureDetector(
                onTap: (){
              Navigator.pushNamed(context, Routes.loginRoute);
                },
                child: const Text('SignIn',
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