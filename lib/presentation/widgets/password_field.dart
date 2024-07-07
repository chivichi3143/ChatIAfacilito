import 'package:flutter/material.dart';

class PasswordField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String label;
  const PasswordField(
      {super.key, required this.controller, this.hintText = "Ingrese la contraseña", this.label = 'Contraseña'});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextFormField(
        controller: controller,
        obscureText: true,
        decoration: InputDecoration(
          labelText: label,
          hintText: hintText,
        ),
        validator: (value) {
          return value == null || value.isEmpty ? 'El campo es requerido' : null;
        },
      ),
    );
  }
}
