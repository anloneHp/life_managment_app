import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:futbol3/constlar/colors.dart';
import 'package:futbol3/ekranlar/register_ekrani.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSplashScreen(
        splash: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Lottie.asset('assets/animations/aa.json'),
            ],
          ),
        ),
        nextScreen: const RegisterEkrani(),
        duration: 3500,
        backgroundColor: arkaplanrengi,
      ),
    );
  }
}
