import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  final String image;
  const AuthButton({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(top: 8, bottom: 8),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey), borderRadius: const BorderRadius.all(Radius.circular(15))),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  image,
                ),
                const Text(
                  "Google",
                  style: TextStyle(fontSize: 15),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
