// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

import '../../../data/providers/base_view.dart';
import '../../../data/providers/viewmodel/exam_prep_view_model.dart';

// ignore: must_be_immutable
class QuestionsPage extends StatelessWidget {
   QuestionsPage({super.key});
 ExamPrepViewModel? model;
 String? selectedAnswer;
  @override
  Widget build(BuildContext context) {
  return BaseView<ExamPrepViewModel>(
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
            //backgroundColor: ColorConstants.transparent,
            body: BuildQuizPage(context),
          ),
        ));
      },
    );
  }
  
  Widget BuildQuizPage(BuildContext context){
  
   return ListView.builder(
    itemCount: model!.questions.length,
    itemBuilder: (context, index){
     final question = model!.questions[index];
     return Padding(padding: const EdgeInsets.all(10.0),
     child: Column(children: [
      Text(question.question,
      style: TextStyle(fontSize: 18.0),),
      SizedBox(height: 10,),
       Wrap(
                  children: [
                    for (int i = 0; i < question.incorrectAnswers.length; i++)
                    
                      RadioListTile<String>(
                        title: Text(question.incorrectAnswers[i]),
                        value: question.incorrectAnswers[i],
                        groupValue: selectedAnswer,
                        onChanged: (value) =>  selectedAnswer = value),
                      
                    RadioListTile<String>(
                      title: Text(question.answer),
                      value: question.answer,
                      groupValue: selectedAnswer,
                      onChanged: (value) =>  selectedAnswer = value),
                    
                  ],
                ),
     ],),);
    });

}}