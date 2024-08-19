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
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary
        ),
        child: const Center(
          child: SimLogoCard()
          ),),
    );
  }
}