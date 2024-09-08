import 'dart:io';

import 'package:flutter/material.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({super.key, required this.errorMessage, this.iconData});
  final String errorMessage;
  final IconData? iconData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              iconData?? Icons.error_outline,
              color: Theme.of(context).colorScheme.error,
              size: !Platform.isAndroid?60:null,
              ),
            Text(errorMessage),
          ],
        ),
      ),
    );
  }
}