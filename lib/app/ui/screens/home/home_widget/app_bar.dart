import 'package:flutter/material.dart';
import 'package:nevilai/app/core/constants/assets_constant.dart';

import '../../../../data/providers/viewmodel/auth_view_model.dart';
import '../../../../routes/routes.dart';

class HomeAppBar extends StatelessWidget  implements PreferredSizeWidget {
  final AuthViewModel authViewModel; 
   HomeAppBar({super.key,  required this.authViewModel});

  @override
  Widget build(BuildContext context) {
    return AppBar(
        automaticallyImplyLeading: false, // Disable back button
       flexibleSpace: 
      //bottom: PreferredSize(preferredSize: const Size.fromHeight(200),
         SizedBox(
          height: 200,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child:  Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 30,),
                Row(children: [
                   Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text('Hello,${authViewModel.username ?? 'Welcome!'}',
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                              
                  )),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(context, Routes.profileRoute);
                  },
                  child: authViewModel.userphoto != null
  ? CircleAvatar(backgroundImage: NetworkImage(authViewModel.userphoto),)
  : const SizedBox(
    height: 50,
  width: 50,
  child: CircleAvatar(
    backgroundColor: Colors.white,
    backgroundImage: AssetImage(AssetConstant.profileIcon),),
  ), 

                //IconButton(onPressed: (){}, icon: const Icon(Icons.person_2_rounded))
            )],),
                
                const Text('Excited to learn something new today?',)
            
              ],
            ),
          ),
          ));
    /* */
  }
  
  @override
  Size get preferredSize => const Size.fromHeight(200);
}