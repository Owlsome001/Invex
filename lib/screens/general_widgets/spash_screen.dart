import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:sim/controllers/app_controller.dart';

import 'init_app_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Image.asset(
        'assets/images/logo.png',
        height: 300,
        width: 300,
      ),
      nextScreen: InitAppScreen(future: AppController.initApp(),),
      duration: 1500,
      backgroundColor: Colors.white,
      splashIconSize: double.infinity,
    );
  }
}