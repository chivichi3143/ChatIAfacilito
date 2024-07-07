import 'package:flutter/material.dart';

class FormHeader extends StatelessWidget {
  final String title;
  final String subtitle;
  const FormHeader({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              subtitle,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
