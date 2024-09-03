import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class StockInfoRow extends StatelessWidget {
  const StockInfoRow({super.key, required this.infoKey, required this.infoValue});
  final String infoKey;
  final String infoValue;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: Text(infoKey),
        ),
        Expanded(
          child: Text(
            infoValue,
            style: TextStyle(
                fontWeight: FontWeight.bold
            ),
            ))
      ],
    );
  }
}