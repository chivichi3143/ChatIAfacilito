import 'package:chatfacilito/presentation/screens/splash_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Chatfacilito',
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
