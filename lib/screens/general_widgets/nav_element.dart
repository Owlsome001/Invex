import 'package:flutter/material.dart';

class NavElement {
  const NavElement(this.icon, {this.onTap, required this.title, this.isSelected =false});
  final String title;
  final Icon icon;
  final Function? onTap;
  final bool isSelected;
}