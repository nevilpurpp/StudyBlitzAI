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
      width: 365,
      height: 142, 
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
          mainAxisAlignment:  MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween ,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.grey.withOpacity(0.2),
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Image.asset(height: 30,
                    width: 30,
                      imagePath,
                    ),
                  ),
                ),
                const Icon(
                  CupertinoIcons.arrow_up_right,
                  color: Colors.black38,
                  size: 30,
                ),
              ],
            ),
            const SizedBox(
              height: 22,
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                title,
                style: const TextStyle(
                
                  color: Colors.black45,
                  fontSize:  23,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }}