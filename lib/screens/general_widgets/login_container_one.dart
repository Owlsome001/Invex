import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sim/screens/general_widgets/sim_logo_card.dart';

class LoginContainerOne extends StatelessWidget {
  const LoginContainerOne({super.key});

  @override
  Widget build(BuildContext context) {
    return  Expanded(
      flex: 4,
      child: Container(
        height: double.infinity,
        padding: EdgeInsets.all(Platform.isAndroid?80:150),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary.withOpacity(0.2)
        ),
        child: const Center(
          child: SimLogoCard()
          ),),
    );
  }
}