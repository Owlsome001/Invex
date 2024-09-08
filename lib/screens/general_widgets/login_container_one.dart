import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
        child: Platform.isAndroid? const Center(
          child: SimLogoCard()
          ):const Column(
            children: [
              Expanded(child: SizedBox()),
              Expanded(
                flex: 2,
                child: SimLogoCard()),
              Expanded(child: SizedBox())
            ],),
          ),
    );
  }
}