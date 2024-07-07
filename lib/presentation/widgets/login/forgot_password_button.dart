import 'package:chatiafacilito/features/forgot_pw_page.dart';
import 'package:flutter/material.dart';

class ForgotPasswordButton extends StatelessWidget {
  const ForgotPasswordButton({super.key, Key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: TextButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const ForgotPasswordPage();
              },
            ),
          );
        },
        child: Text(
          "Olvide mi contraseña?",
          style: TextStyle(
              fontWeight: FontWeight.w500, color: Colors.deepPurple.shade200),
        ),
      ),
    );
  }
}
