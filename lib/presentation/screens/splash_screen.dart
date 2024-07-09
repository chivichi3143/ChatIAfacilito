import 'package:chatiafacilito/features/auth_page.dart';
import 'package:chatiafacilito/images/assets.dart';
import 'package:chatiafacilito/presentation/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animationOpacity;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _animationOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeIn),
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          Future.delayed(const Duration(seconds: 5)).then((_) {
            _navigateToLoginScreen();
          });
        }
      });

    _animationController.forward();
  }

  void _navigateToLoginScreen() async {
    _animationController.reverse().then((value) async {
      await Future.delayed(const Duration(milliseconds: 500));
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => const AuthPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Lottie.asset(splashMainLottieImage, width: 250),
            const SizedBox(height: 10),
            FadeTransition(
              opacity: _animationOpacity,
              child: const Text(
                'ChatIAFacilito',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
