import 'package:flutter/material.dart';

class SquareTile extends StatelessWidget {
  final String imagePath;
  final Function()? onTap;
  const SquareTile({super.key, required this.imagePath, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          
          border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(16),
        ),
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Image.asset(
              imagePath,
              height: 25,
            ),
          ])
      ),
    );
  }
}
