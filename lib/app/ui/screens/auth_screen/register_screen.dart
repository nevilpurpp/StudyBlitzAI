import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/constants/assets_constant.dart';
import '../../../data/providers/base_view.dart';
import '../../../data/providers/viewmodel/auth_view_model.dart';
import '../../../routes/routes.dart';
import '../../widgets/common_text_form_field.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _selectedCourseId;
 
  AuthViewModel? model;

  @override
  Widget build(BuildContext context) {
    return BaseView<AuthViewModel>(
      onModelReady: (model) {
        this.model = model;
      },
      builder: (context, model, child) {
        return SafeArea(
          child: GestureDetector(
            onTap: () {
              FocusManager.instance.primaryFocus?.unfocus();
              model.keyboard(false);
            },
            child: Scaffold(
              body: buildRegistrationPage(context),
            ),
          ),
        );
      },
    );
  }

  Widget buildRegistrationPage(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            const SizedBox(height: 80),
            SizedBox(
              height: 100,
              width: 100,
              child: Image.asset(
                AssetConstant.applogo,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Hello There!!',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            const Text(
              "Let's Get started",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            // Name
            CommonTextFormField(
              prefixIconWidget: const Icon(Icons.person),
              controller: model!.nameController,
              hintTextWidget: 'Enter Your Username',
            ),
            const SizedBox(height: 10),
            // Email
            CommonTextFormField(
              prefixIconWidget: const Icon(Icons.email),
              controller: model!.emailController,
              hintTextWidget: 'Enter Your Email',
            ),
            const SizedBox(height: 10),
            // Password
            CommonTextFormField(
              prefixIconWidget: const Icon(Icons.password),
              controller: model!.passwordController,
              hintTextWidget: 'Enter Your Password',
              obsocuringCharacter: '*',
              obscureText: true,
            ),
            const SizedBox(height: 10),
            // Course Dropdown
            StreamBuilder<QuerySnapshot>(
              stream: model!.getCourses(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return CircularProgressIndicator();
                }

                var courses = snapshot.data!.docs;
                return DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    labelText: 'Course',
                    prefixIcon: Icon(Icons.book),
                  ),
                  value: _selectedCourseId,
                  items: courses.map((course) {
                    return DropdownMenuItem<String>(
                      value: course.id,
                      child: Text(course['courseName']),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedCourseId = value;
                      //_selectedModuleId = null; // Reset module selection
                    });
                  },
                  validator: (value) {
                    if (value == null) {
                      return 'Please select a course';
                    }
                    return null;
                  },
                );
              },
            ),
        
            const SizedBox(height: 10),
            // Register Button
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 45,
                width: 300,
                child: ElevatedButton(
                  onPressed: () async {
                    String name = model!.nameController.text;
                    String email = model!.emailController.text;
                    String password = model!.passwordController.text;

                    // Perform validation
                    if (name.isEmpty ||
                        email.isEmpty ||
                        password.isEmpty ||
                        _selectedCourseId == null ||
                        _selectedModuleId == null) {
                      // Show error message
                      return;
                    }

                    // Call registerWithEmailAndPassword
                    final credential = await model!.registerWithEmailAndPassword(
                      name,
                      email,
                      password,
                      _selectedCourseId!,
                      
                    );
                    if (credential != null) {
                      // Handle successful registration (navigate to home?)
                      Navigator.pushNamed(context, Routes.homeRoute);
                    } else {
                      // Handle registration errors
                    }
                  },
                  child: const Text('Register'),
                ),
              ),
            ),
            // Sign in with Google
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 45,
                width: 300,
                child: OutlinedButton(
                  onPressed: () async {
                    final credential = await model!.signInWithGoogle();
                    if (credential != null) {
                      Navigator.pushNamed(context, '/home');
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: 40,
                          width: 40,
                          child: Image.asset(
                            AssetConstant.googleIcon,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      const Text('SignIn with Google'),
                    ],
                  ),
                ),
              ),
            ),
            // Sign In Redirect
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Already have an account?'),
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, Routes.loginRoute);
                    },
                    child: const Text(
                      'Sign In',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
