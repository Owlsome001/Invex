import 'package:flutter/material.dart';

class StockStateIndicator extends StatelessWidget {
  const StockStateIndicator({super.key, required this.color});
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      color: color,
    );
  }
}