import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  ThemeMode thhemeMode = ThemeMode.system;
  List<String> modelsList = []; // Initialize modelsList

  @override
  void initState() {
    super.initState();
    _fetchModels(); // Fetch models in initState
  }

  void _fetchModels() async {
    final models = await Gemini.instance.listModels();
    setState(() {
      modelsList = models.cast<String>();
    });
  }

  void _toggleTheme(ThemeMode themeMode) {
    setState(() {
      thhemeMode = themeMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Text('All Models'),
            ListView.builder(
              itemCount: modelsList.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(modelsList[index]),
                );
              },
            ),
            const SizedBox(height: 10),
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
    );
  }
}
