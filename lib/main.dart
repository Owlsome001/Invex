import 'package:flutter/material.dart';
import 'package:sim/controllers/login_controller.dart';
import 'package:sim/theme.dart';

void main() {
  runApp(const Sim());
}

class Sim extends StatelessWidget {
  const Sim({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: simTheme,
      home: LoginController.platformLoginScreen(),
    );
  }
}
