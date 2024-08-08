import 'package:flutter/material.dart';
import '../../../data/providers/base_view.dart';
import '../../../data/providers/viewmodel/theme_model.dart';
import '../../../routes/routes.dart';
import '../../widgets/custom_listtile.dart';


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
                onTap: (){
                  Navigator.pushNamed(context, Routes.profileRoute);
                },
                child: const CustomListTile(
                  title: 'Profile',
                  leading: Icon(Icons.person_2_rounded, ),
                  trailing: Icon(Icons.arrow_forward_ios_rounded),
                ),
              ),
               CustomListTile(
                title: 'Theme',
                leading: const Icon(Icons.lightbulb_circle_rounded,
                ),
                trailing: Switch(
                  value: model.themeMode == ThemeMode.dark,
                  onChanged: (value) {
                    model.toggleTheme(value);
                  },
                ),
              ),
               GestureDetector(
                 child: const CustomListTile(
                  title:'About',
                  leading: Icon(Icons.info_outline_rounded,),
                  trailing: Icon(Icons.arrow_forward_ios_rounded,),
                               ),
               ),
            ],
          );
        },
      ),
    );
  }
}
