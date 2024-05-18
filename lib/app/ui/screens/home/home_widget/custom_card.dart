
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
   const CustomCard({super.key, 
  required this.title,
  required this.image,
  });
   final String title;
   final String image;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      height:150, 
      child: Column(
        children: [
          const SizedBox(height: 25,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(image, 
            height: 80,
            width: 80,
            fit: BoxFit.contain,),
          ),
          Text(title, 
          style: 
          const TextStyle(
            fontWeight: FontWeight.bold,
          fontSize: 25),)
        ],
      ),
    );
  }
}