
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
   CustomCard({super.key, 
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
          Image.asset(image),
          Text(title)
        ],
      ),
    );
  }
}