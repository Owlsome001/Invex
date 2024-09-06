import 'dart:io';

import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({super.key, this.fieldName, required this.fieldHint, this.suffixIcon, this.obscureText, required this.controller, this.padding, this.borderRadius});
  final String? fieldName;
  final String fieldHint;
  final IconButton? suffixIcon;
  final bool? obscureText;
  final EdgeInsets? padding;
  final TextEditingController controller;
  final BorderRadiusGeometry? borderRadius;

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        fieldName!=null? Expanded(
          flex: Platform.isAndroid? 10:25,
          child: const SizedBox()):const SizedBox(),
        
        Expanded(
          flex: 50,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              fieldName!=null?Text(fieldName!):const SizedBox(),
              Container(
                padding: padding?? const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: borderRadius?? BorderRadius.circular(10),
                  color: Theme.of(context).colorScheme.primary.withOpacity(0.2)
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

       fieldName!=null? Expanded(
          flex: Platform.isAndroid? 10:25,
          child: const SizedBox()):const SizedBox(),
      ],
      
    );
  }
}

class CustomFormFied extends StatelessWidget {
  const CustomFormFied({super.key, required this.fieldName, required this.field});
  final String fieldName;
  final Widget field;

  @override
  Widget build(BuildContext context) {
    return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          child: Row(
                            children: [
                              Expanded (
                                flex: 4,
                                child: Text(fieldName)),
                              Expanded(
                                flex: 6,
                                child: field ),
                            ],
                          ),
                        );
                        // DropdownButtonFormField(items: items, onChanged: onChanged);
  }
}