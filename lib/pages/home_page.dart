import 'package:flutter/material.dart';

import '../models/section_item.dart';
import '../sections/chat.dart';
import '../sections/chat_stream.dart';
import '../sections/embed_batch_contents.dart';
import '../sections/embed_content.dart';
import '../sections/response_widget_stream.dart';
import '../sections/stream.dart';
import '../sections/text_and_image.dart';
import '../sections/text_only.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  ThemeMode thhemeMode = ThemeMode.system;

  void _toggleTheme(ThemeMode themeMode) {
    setState(() {
      thhemeMode = themeMode;
    });
  }
  int _selectedItem = 0;

  final _sections = <SectionItem>[
    SectionItem(0, 'Stream text', const SectionTextStreamInput()),
    SectionItem(1, 'textAndImage', const SectionTextAndImageInput()),
    SectionItem(2, 'chat', const SectionChat()),
    SectionItem(3, 'Stream chat', const SectionStreamChat()),
    SectionItem(4, 'text', const SectionTextInput()),
   // SectionItem(5, 'embedContent', const SectionEmbedContent()),
    //SectionItem(6, 'batchEmbedContents', const SectionBatchEmbedContents()),
    SectionItem(
        7, 'response without setState()', const ResponseWidgetSection()),
  ];
  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return  Scaffold(
      appBar: AppBar(
        title: Text(_selectedItem == 0
            ? 'Nevil AI Studio'
            : _sections[_selectedItem].title),
        actions: [
          PopupMenuButton<int>(
            initialValue: _selectedItem,
            onSelected: (value) => setState(() => _selectedItem = value),
            itemBuilder: (context) => _sections.map((e) {
              return PopupMenuItem<int>(value: e.index, child: Text(e.title));
            }).toList(),
            child: const Icon(Icons.more_vert_rounded),
          )
        ],
      ),
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Switch(
            value: isDarkMode,
            onChanged: (isOn) {
              isOn
                ? _toggleTheme(ThemeMode.dark)
                : _toggleTheme(ThemeMode.light);
            },
          ),
            ],
          ),
        ),
      ),
      body: IndexedStack(
        index: _selectedItem,
        children: _sections.map((e) => e.widget).toList(),
      ),
    );
  }
}