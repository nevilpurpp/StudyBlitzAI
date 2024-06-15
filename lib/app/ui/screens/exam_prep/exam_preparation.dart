
import 'package:flutter/material.dart';
import 'package:nevilai/app/data/providers/viewmodel/exam_prep_view_model.dart';
import 'package:path/path.dart';

import '../../../core/theme/my_app_colors.dart';
import '../../../data/providers/base_view.dart';
import '../../../routes/routes.dart';
import '../../widgets/common_sized_box.dart';
import '../../widgets/common_text.dart';
import '../../widgets/common_text_form_field.dart';

// ignore: must_be_immutable
class ExamPreparation extends StatelessWidget {
   ExamPreparation({super.key});
  ExamPrepViewModel? model;
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
            body: buildBody(context),
          ),
        ));
      },
    );
  }
  Widget buildBody(BuildContext context) {
    return Column(
      children: [
        CommonSizedBox(height: 10),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(30)),
                child: IconButton(onPressed: (){
                 Navigator.of(context).pop();
                }, icon: const Icon(Icons.arrow_back_ios_new),),
              ),
            ),
            const SizedBox(width: 10,),
            CommonText(
              text: 'Quick Quiz Practice',
              color: ColorConstants.white,
              fontSize: 22,
              fontWeight: FontWeight.w400,
            ),
            
          ],
        ),
Form(child: 
    Column(
      children: [
         //unit/subject
             CommonTextFormField(
              controller: model!.subjectController,
              hintTextWidget: 'enter subject/unit',
             ),
             CommonSizedBox(
              height: 20,
             ),
             // enter topic
             CommonTextFormField(
              controller: model!.topicController,
              hintTextWidget: 'enter topic',
             ),
             CommonSizedBox(
              height: 20,
             ), 
               //send data
             ElevatedButton(
              onPressed: () async{
                 model!.constructPrompt();
                
                 const Center(child: CircularProgressIndicator.adaptive(),);
                await Navigator.pushNamed(context, Routes.quizRoute);
                //Navigator.pushNamed(context, '/home');
              },
              child: const Text('Submit'),
             ),
           
      ],
    )
    )
      ],
    );
  }

}