import 'package:flutter/material.dart';
import 'package:sim/screens/general_widgets/login_container_one.dart';
import 'package:sim/screens/general_widgets/login_container_two.dart';

class MobileLoginScreen extends StatelessWidget {
  const MobileLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          LoginContainerOne(),
          LoginContainerTwo()
        ],
      ),
    );
  }
}