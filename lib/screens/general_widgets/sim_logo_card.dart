import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SimLogoCard extends StatelessWidget {
  const SimLogoCard({super.key});
  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Image.asset(
          'assets/images/logo.png',
          ),
        ),
        Text(
          "Inventaire sans stress",
           style: TextStyle(
            color: Theme.of(context).colorScheme.primary,
          ),
          )
      ],);
  }
}