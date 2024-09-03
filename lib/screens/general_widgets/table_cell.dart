import 'package:flutter/material.dart';

class ScreenTableCell extends StatelessWidget {
  const  ScreenTableCell({super.key, required this.value, required this.rowIndex});
  final String value;
  final int rowIndex;

  @override
  Widget build(BuildContext context) {
    return  TableCell(
      child: Padding(
        padding:  EdgeInsets.symmetric(vertical: 5, horizontal: rowIndex==0?20:0.0),
        child: Text(value),
        ),
      );
  }
}