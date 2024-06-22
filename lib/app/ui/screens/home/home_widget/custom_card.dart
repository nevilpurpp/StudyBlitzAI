
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
   const CustomCard({
   required this.title,
    required this.imagePath,
    required this.color,
    required this.isMainButton,
    required this.onPressed,
    super.key,
  });
  final String title;
  final String imagePath;
  final Color color;
  final bool isMainButton;
  final VoidCallback onPressed;
  
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      height:isMainButton ? 250 : 150, 
      child: ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(16),
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                backgroundColor:
                    Colors.grey.withOpacity(0.2),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Image.asset(
                    imagePath,
                    //color: context.colorScheme.background,
                  ),
                ),
              ),
             const Icon(
                CupertinoIcons.arrow_up_right,
                color: Colors.black38,
                size: 32,
              ),
            ],
          ),
          SizedBox(
            height: isMainButton ? 50: 8,
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              title,
              style: TextStyle(
                color: Colors.black45
                ,
                fontSize: isMainButton ? 32 :17,
              ),
            ),
          ),
        ],
      ),
    )
    );
  }
}