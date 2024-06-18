import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:nevilai/app/data/providers/viewmodel/exam_prep_view_model.dart';
import '../../../core/utils/utils.dart';
import '../../../data/hive_adapter/quiz_history.dart';
import '../../../data/providers/base_view.dart';
import '../../../routes/routes.dart';
import '../../widgets/common_sized_box.dart';
import '../../widgets/common_text_form_field.dart';
import 'quiz_detail.dart';

class ExamPreparation extends StatelessWidget {
  ExamPreparation({Key? key}) : super(key: key);

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
              ],
            ),
          ),
        );
      },
    );
  }

  Widget buildQuizHistory(){
    return
    FutureBuilder(
        future: Hive.openBox('quizHistory'),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              var box = snapshot.data as Box;
              return ListView.builder(
                itemCount: box.length,
                itemBuilder: (context, index) {
                  var quiz = box.getAt(index) as Map;
                  var questions = quiz['questions'] as List<QuizQuestion>;
                  var answers = quiz['answers'] as List<UserAnswer>;
                  return ListTile(
                    title: Text('Quiz ${index + 1}'),
                    subtitle: Text('Subject: ${questions[0].question}'), // Adjust to show subject/topic
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => QuizDetailPage(
                            questions: questions,
                            answers: answers,
                          ),
                        ),
                      );
                    },
                  );
                },
              );
            }
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      );
  }
}
