import 'package:chatiafacilito/config/theme/app_theme.dart';
import 'package:chatiafacilito/presentation/screens/chat_list.dart';
import 'package:chatiafacilito/presentation/screens/register_screen.dart';
import 'package:chatiafacilito/presentation/widgets/email_field.dart';
import 'package:chatiafacilito/presentation/widgets/login/auth_google_button.dart';
import 'package:chatiafacilito/presentation/widgets/login/forgot_password_button.dart';
import 'package:chatiafacilito/presentation/widgets/login/form_header.dart';
import 'package:chatiafacilito/presentation/widgets/login/login_separator.dart';
import 'package:chatiafacilito/presentation/widgets/password_field.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _formKey.currentState?.reset();
    super.dispose();
  }

  void _loginUser() {
    if (_formKey.currentState!.validate()) {
      String email = _emailController.text;
      String password = _passwordController.text;

      print(email);
      print(password);
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ChatList()));
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
            child: Form(
              key: _formKey,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //* Header
                    const FormHeader(
                      title: 'Inicia sesión en ChatFacilito',
                      subtitle: "Bienvenido a ChatIAFacilito, inicia sesión o regístrate!",
                    ),
                    //* Email Field
                    EmailField(
                      controller: _emailController,
                    ),
                    //* Password Field
                    PasswordField(controller: _passwordController),
                    //* Login button
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: _loginUser,
                              child: const Text(
                                'Iniciar sesión',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: Row(
                        children: [
                          Expanded(
                              child: OutlinedButton(
                            onPressed: () {
                              Navigator.of(context)
                                  .push(MaterialPageRoute(
                                  builder: (BuildContext context) => RegisterScreen(loginFormKey: _formKey)));
                            },
                            child: const Text('Registrarse'),
                          )),
                        ],
                      ),
                    ),
                    //* Forgot password section
                    const ForgotPasswordButton(),
                    //* Separator
                    const LoginSeparator(),
                    //* Google Authentication
                    const AuthGoogleButton(
                      image: "assets/images/google.png",
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
