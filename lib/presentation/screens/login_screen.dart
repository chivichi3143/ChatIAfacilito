import 'package:chatiafacilito/config/theme/app_theme.dart';
import 'package:chatiafacilito/presentation/screens/chat_list.dart';
import 'package:chatiafacilito/presentation/widgets/login/auth_button.dart';
import 'package:chatiafacilito/presentation/widgets/login/forgot_password_button.dart';
import 'package:chatiafacilito/presentation/widgets/login/login_separator.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
                      'Log in to ChatFacilito',
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
                    height: 30,
                  ),
                  const TextField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'Correo',
                      hintText: 'Ingresa tu correo',
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Contraseña',
                      hintText: 'Ingresa tu contraseña',
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 30, bottom: 30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Builder(builder: (context) {
                                return ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(builder: (context) => const ChatList()));
                                  },
                                  child: const Text(
                                    'Log in',
                                  ),
                                );
                              }),
                            ),
                          ],
                        ),
                        const ForgotPasswordButton(),
                        const LoginSeparator(),
                        const AuthButton(
                          image: "assets/images/google.png",
                        ),
                      ],
                    ),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
