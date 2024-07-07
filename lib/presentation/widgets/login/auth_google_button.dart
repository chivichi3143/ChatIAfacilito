import 'package:flutter/material.dart';

class AuthGoogleButton extends StatelessWidget {
  final String image;
  const AuthGoogleButton({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Column(
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
      ),
    );
  }
}
