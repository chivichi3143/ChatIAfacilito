import 'package:chatiafacilito/config/theme/app_theme.dart';
import 'package:chatiafacilito/presentation/screens/chat_list.dart';
import 'package:chatiafacilito/presentation/screens/login_screen.dart';
import 'package:chatiafacilito/presentation/widgets/email_field.dart';
import 'package:chatiafacilito/presentation/widgets/login/form_header.dart';
import 'package:chatiafacilito/presentation/widgets/password_field.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  final GlobalKey<FormState> loginFormKey;
  const RegisterScreen({super.key, required this.loginFormKey});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    print('holaa');
    _formKey.currentState?.reset();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _registerUser() {
    if (_formKey.currentState!.validate()) {
      String email = _emailController.text;
      String password = _passwordController.text;
      String confirmPassword = _confirmPasswordController.text;

      print(email);
      print(password);
      print(confirmPassword);
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const ChatList()));
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
                    const FormHeader(
                      title: 'Regístrate en ChatIAFacilito',
                      subtitle: "Únete a ChatIAFacilito y chatea de forma fácil con IA",
                    ),
                    EmailField(
                      controller: _emailController,
                    ),
                    //* Password Field
                    PasswordField(controller: _passwordController),
                    //* Confirm Password Field
                    PasswordField(
                      controller: _confirmPasswordController,
                      hintText: 'Confirmar contraseña',
                      label: 'Confirmar contraseña',
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: _registerUser,
                              child: const Text(
                                'Registrarse',
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
                                widget.loginFormKey.currentState!.reset();
                                Navigator.of(context)
                                    .pop(MaterialPageRoute(builder: (BuildContext context) => const LoginScreen()));
                              },
                              child: const Text(
                                'Cancelar',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
