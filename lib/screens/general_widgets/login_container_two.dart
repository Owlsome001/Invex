import 'package:flutter/material.dart';
import 'package:sim/screens/general_widgets/login_form.dart';

class LoginContainerTwo extends StatelessWidget {
  const LoginContainerTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return  Expanded(
      flex: 6,
      child: Container(
        height: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white
        ),
        child: const Center(
          child:  SimLoginForm()
          ),),
    );
  }
}