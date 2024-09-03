import 'package:flutter/material.dart';

class RowAction {
  final String commandName;
  final IconData iconData;
  final Function onTap;

  const RowAction(this.commandName, this.iconData, this.onTap);
}