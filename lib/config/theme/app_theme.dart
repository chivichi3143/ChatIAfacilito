import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color _customeColor = Color.fromARGB(255, 110, 24, 248);

const List<Color> _colorThemes = [
  _customeColor,
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.yellow,
  Colors.orange,
];

class AppTheme {
  ThemeData theme() {
    return ThemeData(
        useMaterial3: false,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple, brightness: Brightness.dark),
        textTheme: TextTheme(
          displayMedium: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.amber),
          bodyMedium: GoogleFonts.poppins(),
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: const OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            borderSide: BorderSide(color: Colors.deepPurple.shade200, width: 2.0),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 1.0),
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            borderSide: BorderSide(color: Colors.red.shade300, width: 2.0),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            borderSide: BorderSide(color: Colors.red.shade300, width: 2.0),
          ),
          labelStyle: TextStyle(color: Colors.deepPurple.shade200),
          hintStyle: const TextStyle(color: Colors.grey),
          errorStyle: TextStyle(color: Colors.red.shade300),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
            style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.all(20),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                side: BorderSide(width: 1.0, color: Colors.deepPurple.shade200))),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(20),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)))));
  }
}
