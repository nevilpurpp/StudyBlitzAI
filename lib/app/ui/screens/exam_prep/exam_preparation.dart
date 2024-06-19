import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:nevilai/app/data/providers/viewmodel/exam_prep_view_model.dart';
import '../../../core/utils/utils.dart';
import '../../../data/providers/base_view.dart';
import '../../../data/providers/viewmodel/auth_view_model.dart';
import '../../../routes/routes.dart';
import '../../widgets/common_sized_box.dart';
import '../../widgets/common_text_form_field.dart';
import 'quiz_detail.dart';

// ignore: must_be_immutable
class ExamPreparation extends StatelessWidget {
   ExamPreparation({Key? key, }) : super(key: key);
AuthViewModel auth = AuthViewModel();

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
                CommonTextFormField(
                  controller: model.subjectController,
                  hintTextWidget: 'Enter subject/unit',
                ),
                CommonSizedBox(height: 20),
                CommonTextFormField(
                  controller: model.topicController,
                  hintTextWidget: 'Enter topic',
                ),
                CommonSizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    if (model.subjectController.text.isNotEmpty && model.topicController.text.isNotEmpty) {
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (BuildContext context) {
                          return const Center(child: CircularProgressIndicator.adaptive());
                        },
                      );
                      await model.generateQuestions();
                      Navigator.pop(context);
                      if (model.questions.isNotEmpty) {
                        Navigator.pushNamed(context, Routes.quizRoute);
                      } else {
                        AppUtils.showError('Something Occurred, Questions not generated');
                      }
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Please fill out all fields.')),
                      );
                    }
                  },
                  child: const Text('Submit'),
                ),

                //display historypage
                const Text('Recent Activity'),
                Expanded(child: buildQuizHistory())
              ],
            ),
          ),
        );
      },
    );
  }

  Widget buildQuizHistory(){
    return
   StreamBuilder(
        stream: FirebaseFirestore.instance.collection('users').doc(auth.user.uid).collection('quizHistory').orderBy('timestamp', descending: true).snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              var data = snapshot.data!.docs[index];
               Timestamp timestamp = data['timestamp']; // Assuming 'timestamp' is a field in your Firestore document
              DateTime dateTime = timestamp.toDate();
              return ListTile(
                title: Text('Quiz ${index + 1} - ${data['subject']}'),
                subtitle: Text('Topic: ${data['topic']}'),
                 trailing: Text(
                  '${dateTime.day}/${dateTime.month}/${dateTime.year} ${dateTime.hour}:${dateTime.minute}',
                  style: TextStyle(fontSize: 12.0, color: Colors.grey),),
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
