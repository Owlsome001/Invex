import 'package:flutter/material.dart';

class SimLogoCard extends StatelessWidget {
  const SimLogoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "SIM",
          style: TextStyle(
            fontSize: 60,
            fontWeight: FontWeight.w700,
            color: Theme.of(context).colorScheme.onBackground,
          ),
          ),
        Text(
          "Système d'Inventaire Militaire",
           style: TextStyle(
            fontSize: 20,
            color: Theme.of(context).colorScheme.onBackground,
          ),
          )
      ],);
  }
}