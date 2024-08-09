import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../../core/constants/assets_constant.dart';
import '../../../data/providers/base_view.dart';
import '../../../data/providers/viewmodel/auth_view_model.dart';
import '../../widgets/custom_listtile.dart';
import '../home/home_page.dart';

// ignore: must_be_immutable
class ProfileScreen extends StatelessWidget {
   ProfileScreen({super.key});
 AuthViewModel? model;
  @override
  Widget build(BuildContext context) {
     return   BaseView<AuthViewModel>(
      onModelReady: (model) {
        this.model = model;
      },
      builder: (context, model, child) {
        return GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
            model.keyboard(false);
          },
          child: Scaffold(
            appBar: AppBar(
              title: const Text('Profile'),
              centerTitle: true,
            ),
            body: buildProfilePage(context) ,
          ),
        );
      }
    );
}
Widget buildProfilePage(BuildContext context){
  return  SingleChildScrollView(
    child: Column(
      children: [
    authViewModel.userphoto != null
  ? CircleAvatar(backgroundImage: NetworkImage(authViewModel.userphoto),)
  : const SizedBox(
    height: 50,
  width: 50,
  child: CircleAvatar(
    backgroundColor: Colors.white,
    backgroundImage: AssetImage(AssetConstant.profileIcon),),
  ), 
       GestureDetector(
        onTap: (){
          model!.signOut();
         // if(model!.signOut() )
        },
         child: const  CustomListTile(
              leading: Icon(Icons.logout_rounded,),
              title: 'Log Out',
              subtitle: 'exit from your account',
              trailing:   Icon(Icons.arrow_forward_ios_rounded,),
          ),)
       
      ],
    ),
  );
}
}

