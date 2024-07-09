import 'package:chatiafacilito/presentation/widgets/button.dart';
import 'package:chatiafacilito/presentation/widgets/login/login_separator.dart';
import 'package:chatiafacilito/presentation/widgets/square_tile.dart';
import 'package:chatiafacilito/presentation/widgets/textfield.dart';
import 'package:chatiafacilito/services/auth_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmpasswordController = TextEditingController();

  void wrongEmailMessage(String message) {
    Widget okButton = TextButton(
      child: const Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    AlertDialog alert = AlertDialog(
      title: const Text("Oops! Intentalo de nuevo!"),
      content: Text(message),
      actions: [
        okButton,
      ],
    );
    showDialog(
      context: context,
      builder: (context) {
        return alert;
      },
    );
  }

  void signUserUp() async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    try {
      if (passwordController.text == confirmpasswordController.text) {
        UserCredential userCredential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
        FirebaseFirestore.instance
            .collection('users')
            .doc(userCredential.user!.uid)
            .set({
          'uid': userCredential.user!.uid,
          'email': userCredential.user!.email,
        });
      } else {
        wrongEmailMessage(('Password no coincide!').toString());
        Navigator.of(context).pop();
      }

      Navigator.of(context).pop();
    } on FirebaseAuthException catch (e) {
      Navigator.of(context).pop();

      wrongEmailMessage(e.message.toString());
    }
  }

  void wrongPasswordMessage(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.deepPurple,
          title: Center(
            child: Text(
              message,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Registrate en ChatIAFacilito"), centerTitle: true),
      // resizeToAvoidBottomInset: false,
      body: Center(
        child: SingleChildScrollView(
          child: FractionallySizedBox(
            widthFactor: 0.90,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 15.0),
                  child: CustomTextField(
                    controller: emailController,
                    hintText: 'Email',
                    obscureText: false,
                  ),
                ),

                // password textfield
                Padding(
                  padding: const EdgeInsets.only(bottom: 15.0),
                  child: CustomTextField(
                    controller: passwordController,
                    hintText: 'Contraseña',
                    obscureText: true,
                  ),
                ),
        
                // Confirm password textfield
                Padding(
                  padding: const EdgeInsets.only(bottom: 15.0),
                  child: CustomTextField(
                    controller: confirmpasswordController,
                    hintText: 'Confirma tu contraseña',
                    obscureText: true,
                  ),
                ),

                // sign in button
                CustomButton(
                  text: 'Sign Up',
                  onTap: signUserUp,
                ),
                
                Container(
                  padding: const EdgeInsets.only(bottom: 25, left: 25, right: 25),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const LoginSeparator(),
                      SquareTile(
                          onTap: () => {AuthService().signInWithGoogle()}, imagePath: 'assets/images/google.png'),
                    ],
                  ),
                ),
        
                Padding(
                  padding: const EdgeInsets.only(bottom: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Ya tienes una cuenta?',
                        style: TextStyle(color: Colors.white),
                      ),
                      const SizedBox(width: 10),
                      GestureDetector(
                        onTap: widget.onTap,
                        child: Text(
                          'Inicia ahora',
                          style: TextStyle(
                            color: Colors.deepPurple.shade200,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // const
              ],
            ),
          ),
        ),
      ),
    );
  }
}
