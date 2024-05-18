import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget  implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
                  const Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Text('Hello Mike,',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                              
                  )),
                ),
                const Spacer(),

                IconButton(onPressed: (){}, icon: const Icon(Icons.person_2_rounded))
                ],),
                
                const Text('Excited to learn something new today?',)
            
              ],
            ),
          ),
          ));
    /* */
  }
  
  @override
  Size get preferredSize => Size.fromHeight(200);
}