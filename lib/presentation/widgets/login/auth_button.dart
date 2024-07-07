import 'package:chatiafacilito/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../features/google_login.dart';

class AuthButton extends StatelessWidget {
  final String image;
  const AuthButton({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        AuthService().signInWithGoogle();
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Image.asset(image),
    );
  }
}
