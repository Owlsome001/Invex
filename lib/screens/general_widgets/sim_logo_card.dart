import 'dart:io';

import 'package:flutter/cupertino.dart';
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
          flex: 6,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
            'assets/images/logo.png',
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Text(
            "Inventaire sans stress",
             style: TextStyle(
              color: Theme.of(context).colorScheme.secondary,
              // fontSize: !Platform.isAndroid?16:null
            ),
            ),
        )
      ],);
  }
}