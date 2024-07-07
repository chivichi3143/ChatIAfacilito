import 'package:chatiafacilito/config/theme/app_theme.dart';
import 'package:chatiafacilito/features/forgot_pw_page.dart';
import 'package:chatiafacilito/presentation/screens/chat_list.dart';
import 'package:chatiafacilito/presentation/screens/register_screen.dart';
import 'package:chatiafacilito/presentation/widgets/email_field.dart';
import 'package:chatiafacilito/presentation/widgets/login/auth_google_button.dart';
import 'package:chatiafacilito/presentation/widgets/login/forgot_password_button.dart';
import 'package:chatiafacilito/presentation/widgets/login/form_header.dart';
import 'package:chatiafacilito/presentation/widgets/login/login_separator.dart';
import 'package:chatiafacilito/presentation/widgets/square_tile.dart';
import 'package:chatiafacilito/services/auth_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  final Function()? onTap;
  const LoginScreen({super.key, required this.onTap});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

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

  // sign user in method
  void signUserIn() async {
    // show loading circle
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    // try sign in
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential.user!.uid)
          .set({
        'uid': userCredential.user!.uid,
        'email': userCredential.user!.email,
      }, SetOptions(merge: true));
      // pop the loading circle
      Navigator.of(context).pop();
    } on FirebaseAuthException catch (e) {
      // pop the loading circle
      Navigator.of(context).pop();
      // WRONG EMAIL

      wrongEmailMessage(e.message.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme().theme(),
      home: Scaffold(
        body: Center(
          child: FractionallySizedBox(
            widthFactor: 0.80,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.only(bottom: 25),
                  child: Text(
                    '      Log in to\n ChatIAFacilito',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                  ),
                ),
                const Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Bienvenido! Inicia sesión con google o con tu correo!',
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: 'Correo',
                    hintText: 'Ingresa tu correo',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Contraseña',
                    hintText: 'Ingresa tu contraseña',
                  ),
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ForgotPasswordButton(),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Builder(builder: (context) {
                              return ElevatedButton(
                                onPressed: () {
                                  signUserIn();
                                },
                                child: const Text(
                                  'Log in',
                                ),
                              );
                            }),
                          ),
                        ],
                      ),
                      const SizedBox(height: 25),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Not a member?',
                            style: TextStyle(color: Colors.white),
                          ),
                          const SizedBox(width: 10),
                          GestureDetector(
                            onTap: widget.onTap,
                            child: const Text(
                              'Register now',
                              style: TextStyle(
                                color: Color.fromARGB(255, 110, 24, 248),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const LoginSeparator(),
                      SquareTile(
                          onTap: () => {AuthService().signInWithGoogle()},
                          imagePath: 'assets/images/google.png'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
