import 'package:flutter/material.dart';

class RowAction {
  final String commandName;
  final IconData iconData;
  final Function({required int selectedIndex}) onTap;
  final bool Function({required int selectedIndex}) toDisplay;

  const RowAction(this.commandName, this.iconData, this.onTap, this.toDisplay);
}