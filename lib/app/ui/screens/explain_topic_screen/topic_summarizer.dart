import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:nevilai/app/core/constants/assets_constant.dart';
import 'package:nevilai/app/data/providers/base_view.dart';
import 'package:nevilai/app/data/providers/viewmodel/topic_summarizer_view.dart';
import 'package:nevilai/app/ui/widgets/common_send_button.dart';
import 'package:nevilai/app/ui/widgets/common_sized_box.dart';
import 'package:nevilai/app/ui/widgets/common_text_form_field.dart';
import 'package:path_provider/path_provider.dart';

import 'dart:io';
import 'package:pdf/widgets.dart' as pw;
import 'package:permission_handler/permission_handler.dart';

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
        return SafeArea(
          child: GestureDetector(
            onTap: () {
              FocusManager.instance.primaryFocus?.unfocus();
              model.keyboard(false);
            },
            child: Scaffold(
              appBar: AppBar(
                title: const Text('Topic Summarizer'),
                centerTitle: true,
              ),
              body: buildTopicBody(context),
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  createPdf();
                },
                child: const Icon(Icons.picture_as_pdf),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget buildTopicBody(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        child: Column(
          children: [
            // Unit/Subject
            CommonTextFormField(
              controller: model!.subjectController,
              hintTextWidget: 'Enter subject/unit',
            ),
            CommonSizedBox(height: 20),
            // Enter Topic
            CommonTextFormField(
              controller: model!.topicController,
              hintTextWidget: 'Enter topic',
            ),
            CommonSizedBox(height: 20),
            // Level
            SizedBox(
              width: 300,
              height: 50,
              child: DropdownButtonFormField<String>(
                borderRadius: BorderRadius.circular(20),
                value: model!.difficulty,
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
                },
                onChanged: (String? value) {
                  model!.difficulty = value!;
                },
              ),
            ),
            CommonSizedBox(),
            // Send Data
            ElevatedButton(
              onPressed: () {
                model!.summarizeTopic();
              },
              child: const Text('Submit'),
            ),
            // Output
            SizedBox(
              height: 400,
              width: 420,
              child: Card.outlined(
                child: Markdown(
                  data: model!.summary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> createPdf() async {
    // 1. Create the PDF document
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) => pw.Center(
          child: pw.Text(model!.summary),
        ),
      ),
    );

    // 2. Get the directory to save the PDF
    final directory = await getExternalStorageDirectory();
    final downloadsDirectory = Directory('${directory!.path}/Documents');
    if (!await downloadsDirectory.exists()) {
      await downloadsDirectory.create(recursive: true);
    }
    final path = '${downloadsDirectory.path}/${model!.topic}.pdf';

    // 3. Handle potential permission issues (optional, but recommended)
    if (!await hasStoragePermissions()) {
      // Request permissions if needed
      await requestStoragePermissions();
    }

    // 4. Save the PDF to the specified path
    final file = File(path);
    await file.writeAsBytes(await pdf.save());

    print('PDF saved to: $path'); // Inform the user about the saved location
  }

  // Function to check for storage permissions (optional)
  Future<bool> hasStoragePermissions() async {
    final permission = await Permission.storage.status;
    return permission == PermissionStatus.granted;
  }

  // Function to request storage permissions (optional)
  Future<void> requestStoragePermissions() async {
    await Permission.storage.request();
  }
}
