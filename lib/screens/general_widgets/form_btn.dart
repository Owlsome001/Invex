import 'dart:io';

import 'package:flutter/material.dart';

class FormBouton extends StatelessWidget {
  const FormBouton({super.key, required this.boutonTitle, required this.onPress});
  final String boutonTitle;
  final Function onPress;
  @override
  Widget build(BuildContext context) {
    return Row(
      
      children: [
        Expanded(
          flex: Platform.isAndroid? 10:25,
          child: const SizedBox()),
        Expanded(
          flex: 50,
          child: Container(
            height: 45,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary.withGreen(100),
              borderRadius: BorderRadius.circular(10)
            ),
            
            width: double.infinity,
            margin: EdgeInsets.zero,
            child: TextButton(
              onPressed: () {
                onPress();
              },
              child: Text(boutonTitle,
              style: TextStyle(color: Theme.of(context).colorScheme.surface),
              )),
          ),
        ),

        Expanded(
          flex: Platform.isAndroid? 10:25,
          child: const SizedBox()),
      ],
    );
  }
}