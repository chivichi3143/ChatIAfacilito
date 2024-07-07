import 'package:flutter/material.dart';

class EmailField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;

  const EmailField({super.key, required this.controller, this.hintText = "Ingresa tu email"});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextFormField(
        validator: (value) {
          return value == null || value.isEmpty ? 'El campo es requerido' : null;
        },
        controller: controller,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          labelText: 'Email',
          hintText: hintText,
        ),
      ),
    );
  }
}
