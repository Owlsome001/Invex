import 'package:flutter/material.dart';

class CustomDropDown extends StatelessWidget {
  const CustomDropDown({super.key, required this.onTap, required this.choices, required this.defaultChoice});
  final Function(int? selectedValue) onTap;
  final List<DropdownMenuItem<int>> choices;
  final int defaultChoice;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      onChanged: (selectedValue)=> onTap(selectedValue),
      items: choices,
      value: defaultChoice,
      hint: Text("Selectionner un article"),
    );
  }
}