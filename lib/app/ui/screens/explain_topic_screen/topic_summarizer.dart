import 'package:flutter/material.dart';
import 'package:nevilai/app/data/providers/base_view.dart';
import 'package:nevilai/app/data/providers/viewmodel/topic_summarizer_view.dart';
import 'package:nevilai/app/ui/widgets/common_send_button.dart';
import 'package:nevilai/app/ui/widgets/common_sized_box.dart';
import 'package:nevilai/app/ui/widgets/common_text_form_field.dart';

// ignore: must_be_immutable
class TopicScreen extends StatelessWidget {
   TopicScreen({super.key});
  TopicSummarizerView? model;


    @override
  Widget build(BuildContext context) {
    return BaseView<TopicSummarizerView>(
      onModelReady: (model) {
        this.model = model;
      },
      builder: (context, model, child) {
        return  SafeArea(child: GestureDetector(
          onTap: (){
          FocusManager.instance.primaryFocus?.unfocus();
          model.keyboard(false);
          },
          child: Scaffold(
            body: buildTopicBody(context),
          ),
        ));
      },
      
    );
  }
  Widget buildTopicBody(BuildContext context){
    return  SingleChildScrollView(
          child: Form(
            child: Column(
              children: [
                //unit/subject
             CommonTextFormField(
              controller: model!.subjectController,
              hintTextWidget: 'enter topic',
             ),
             CommonSizedBox(
              height: 20,
             ),
             // enter topic
             CommonTextFormField(
              controller: model!.topicController,
              hintTextWidget: 'enter subject/unit',
             ),
             CommonSizedBox(
              height: 20,
             ),
             //level 
            
DropdownButtonFormField<String>(

  value: model!.difficulty, // Access difficulty property from provided model
  items: <String>[
    'Beginner',
    'Intermediate',
    'Expert',
  ].map<DropdownMenuItem<String>>((String value) {
    return DropdownMenuItem<String>(
      value: value,
      child: Text(value),
    );
  }).toList(),
  hint: const Text('Please choose a difficulty level'),
  onSaved: (String? value) {
    
    model!.difficulty = value!;
               // Update difficulty property in the model
  }, onChanged: (String? value) { 
    model!.difficulty = value!;
   },
),
CommonSizedBox(),
             //send data
             CommonSendButton(
              onPressed: () {
              model!.summarizeTopic();
             }),
             //output
             SizedBox(
              height: 200,
              width: 200,
              child: Text(model!.summary),
             )

              ],
            ),
          ),
    );
  }
}