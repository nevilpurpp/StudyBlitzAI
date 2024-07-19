import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nevilai/app/data/providers/viewmodel/exam_prep_view_model.dart';
import '../../../core/utils/utils.dart';
import '../../../data/providers/base_view.dart';
import '../../../data/providers/viewmodel/auth_view_model.dart';
import '../../../routes/routes.dart';
import '../../widgets/common_sized_box.dart';
import '../../widgets/common_text_form_field.dart';
import 'quiz_detail.dart';

class ExamPreparation extends StatefulWidget {
  ExamPreparation({Key? key}) : super(key: key);

  @override
  _ExamPreparationState createState() => _ExamPreparationState();
}

class _ExamPreparationState extends State<ExamPreparation> {
  AuthViewModel auth = AuthViewModel();
  ExamPrepViewModel model = ExamPrepViewModel();
 // String? _selectedModuleId;
  //String? _selectedSubjectId;
 // String? _courseId;

  @override
  void initState() {
    super.initState();
   // fetchUserCourseId();
  }
/*
  Future<void> fetchUserCourseId() async {
    try {
      final userDoc = await auth.getUserDetails();
      setState(() {
        _courseId = userDoc['courseId'];
      });
      print('Course ID: $_courseId'); // Debug print
    } catch (e) {
      AppUtils.showError('An error occurred: $e');
    }
  }
*/
  @override
  Widget build(BuildContext context) {
    return BaseView<ExamPrepViewModel>(
      onModelReady: (model) {},
      builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Quick Quiz Practice'),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 10),
                /*if (_courseId != null)
                  StreamBuilder<QuerySnapshot>(
                    stream: model.getModules(_courseId!),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return const CircularProgressIndicator();
                      }

                      var modules = snapshot.data!.docs;
                      return DropdownButtonFormField<String>(
                        decoration: const InputDecoration(
                          labelText: 'Module',
                          prefixIcon: Icon(Icons.layers),
                        ),
                        value: _selectedModuleId,
                        items: modules.map((module) {
                          return DropdownMenuItem<String>(
                            value: module.id,
                            child: Text(module['moduleName']),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            _selectedModuleId = value;
                            _selectedSubjectId = null; // Reset subject selection
                            print('Selected Module ID: $value'); // Debug print
                          });
                        },
                        validator: (value) {
                          if (value == null) {
                            return 'Please select a module';
                          }
                          return null;
                        },
                      );
                    },
                  ),
                if (_selectedModuleId != null)
                  StreamBuilder<QuerySnapshot>(
                    stream: model.getSubjects(_selectedModuleId!),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return const CircularProgressIndicator();
                      }

                      var subjects = snapshot.data!.docs;
                      return DropdownButtonFormField<String>(
                        decoration: const InputDecoration(
                          labelText: 'Subject',
                          prefixIcon: Icon(Icons.book),
                        ),
                        value: _selectedSubjectId,
                        items: subjects.map((subject) {
                          return DropdownMenuItem<String>(
                            value: subject['subjectName'],
                            child: Text(subject['subjectName']),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            _selectedSubjectId = value;
                            model.selectedSubject = value; // Set selected subject in ViewModel
                            if (kDebugMode) {
                              print('Selected Subject: $value');
                            } // Debug print
                          });
                        },
                        validator: (value) {
                          if (value == null) {
                            return 'Please select a subject';
                          }
                          return null;
                        },
                      );
                    },
                  ),*/
                   CommonTextFormField(
                  controller: model.subjectController,
                  hintTextWidget: 'Enter subject',
                ),
                CommonSizedBox(height: 20),
                CommonTextFormField(
                  controller: model.topicController,
                  hintTextWidget: 'Enter topic',
                ),
                CommonSizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    if (model.subjectController.text.isNotEmpty &&
                        model.topicController.text.isNotEmpty) {
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (BuildContext context) {
                          return const Center(
                              child: CircularProgressIndicator.adaptive());
                        },
                      );
                      await model.generateQuestions();
                      Navigator.pop(context);
                      if (model.questions.isNotEmpty) {
                        Navigator.pushNamed(context, Routes.quizRoute);
                      } else {
                        AppUtils.showError(
                            'Something Occurred, Questions not generated');
                      }
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Please fill out all fields.')),
                      );
                    }
                  },
                  child: const Text('Submit'),
                ),
                const Text('Recent Activity'),
                Expanded(child: buildQuizHistory()),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget buildQuizHistory() {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('users')
          .doc(model.auth.user!.uid)
          .collection('quizHistory')
          .orderBy('timestamp', descending: true)
          .snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
          itemCount: snapshot.data!.docs.length,
          itemBuilder: (context, index) {
            var data = snapshot.data!.docs[index];
            return ListTile(
              title: Text('Quiz ${index + 1} - ${data['subject']}'),
              subtitle: Text('Topic: ${data['topic']}'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QuizDetailPage(data: data),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
