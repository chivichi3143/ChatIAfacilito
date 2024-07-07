import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          enabledBorder: theme.inputDecorationTheme.enabledBorder,
          focusedBorder: theme.inputDecorationTheme.focusedBorder,
          fillColor: theme.inputDecorationTheme.fillColor,
          filled: true,
          hintText: hintText,
          hintStyle: theme.inputDecorationTheme.hintStyle,
        ),
      ),
    );
  }
}
