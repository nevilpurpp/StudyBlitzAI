import 'package:flutter/material.dart';

import '../../../../data/providers/viewmodel/auth_view_model.dart';

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
                  child: Text('Hello ${authViewModel.username}!,',
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                              
                  )),
                ),
                const Spacer(),
                CircleAvatar(backgroundImage: NetworkImage(authViewModel.userphoto),)
                //IconButton(onPressed: (){}, icon: const Icon(Icons.person_2_rounded))
                ],),
                
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