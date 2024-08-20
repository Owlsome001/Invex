import 'dart:io';

import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({super.key, required this.fieldName, required this.fieldHint, this.suffixIcon, this.obscureText, required this.controller});
  final String fieldName;
  final String fieldHint;
  final IconButton? suffixIcon;
  final bool? obscureText;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Expanded(
          flex: Platform.isAndroid? 10:25,
          child: const SizedBox()),
        
        Expanded(
          flex: 50,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(fieldName),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Theme.of(context).colorScheme.background
                ),
                child: TextFormField(
                  controller: controller,
                  obscureText: obscureText?? false,
                  decoration: InputDecoration(
                    hintText: fieldHint,
                    hintStyle: TextStyle(color: Theme.of(context).colorScheme.onSurface.withOpacity(0.40)),
                    border: InputBorder.none,
                    suffixIcon: suffixIcon,
                ),
                          
                ),
              )
            ],
          ),
        ),

        Expanded(
          flex: Platform.isAndroid? 10:25,
          child: const SizedBox()),
      ],
      
    );
  }
}