import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}
class _SettingsPageState extends State<SettingsPage> {

  ThemeMode _themeMode = ThemeMode.system;

  void _toggleTheme(ThemeMode themeMode) {
    setState(() {
      _themeMode = themeMode;
    });
  }
  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(),
      body:  SingleChildScrollView(
          child: Center(child: Switch(
            value: isDarkMode,
            onChanged: (isOn) {
              isOn
                ? _toggleTheme(ThemeMode.dark)
                : _toggleTheme(ThemeMode.light);
            },
          ),),
      ),
    );
  }
}