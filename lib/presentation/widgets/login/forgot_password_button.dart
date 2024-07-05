import 'package:flutter/material.dart';

class ForgotPasswordButton extends StatelessWidget {
  const ForgotPasswordButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Text(
        "Forgot password?",
        style: TextStyle(fontWeight: FontWeight.w500, color: Colors.deepPurple.shade200),
      ),
    );
  }
}
