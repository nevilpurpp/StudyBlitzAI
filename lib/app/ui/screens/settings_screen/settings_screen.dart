import 'package:flutter/material.dart';
import '../../../data/providers/base_view.dart';
import '../../../data/providers/viewmodel/theme_model.dart';


class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: BaseView<ThemeModel>(
        builder: (context, model, child) {
          return ListView(
            children: [
              GestureDetector(
                child: ListTile(
                  title: const Text('Profile'),
                  leading: Icon(Icons.person_2_rounded, 
                  color: Theme.of(context).colorScheme.primary,),
                  trailing: Icon(Icons.arrow_forward_ios_rounded, 
                  color: Theme.of(context).colorScheme.primary,),
                ),
              ),
              ListTile(
                title: const Text('Theme'),
                leading: Icon(Icons.lightbulb_circle_rounded,
                color: Theme.of(context).colorScheme.primary),
                trailing: Switch(
                  value: model.themeMode == ThemeMode.dark,
                  onChanged: (value) {
                    model.toggleTheme(value);
                  },
                ),
              ),
               ListTile(
                title: const Text('About'),
                leading: Icon(Icons.info_outline_rounded,
                color: Theme.of(context).colorScheme.primary),
                trailing: Icon(Icons.arrow_forward_ios_rounded,
                color: Theme.of(context).colorScheme.primary),
              ),
            ],
          );
        },
      ),
    );
  }
}
