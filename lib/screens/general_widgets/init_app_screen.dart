
import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:sim/controllers/app_controller.dart';

class InitAppScreen extends StatelessWidget {
  const InitAppScreen({super.key, required this.future});
  final Future<Widget> future;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Widget>(
      future: future, builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot){ 
        if(snapshot.hasError){
        } 
        if (snapshot.hasData) {
          return snapshot.data;
        }else{
          return Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  LoadingAnimationWidget.fourRotatingDots(
                    color: Theme.of(context).colorScheme.secondary, size: Platform.isAndroid?40:80
                    ),

                  ValueListenableBuilder(valueListenable: AppController.initAppStep, builder: (context,value, child){
                    return Text(value);
                  })
                  
                ],
              ) 
              ));
        }
      }
    );
  }
}