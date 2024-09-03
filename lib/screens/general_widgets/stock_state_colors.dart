import 'package:flutter/material.dart';

class StockStateIndicatorColors extends StatelessWidget {
  const StockStateIndicatorColors({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Row(
              children: [
                
                Container(
                  margin: const EdgeInsets.only(right: 10),
                  height: 20,
                  width: 20,
                  color: Theme.of(context).colorScheme.secondary.withOpacity(0.8),
                ),

                const Text("Disponible"),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Row(
              children: [
               
                Container(
                  margin: const EdgeInsets.only(right: 10),
                  height: 20,
                  width: 20,
                  color: Theme.of(context).colorScheme.error,
                ),
            
                 const Text("En allerte"),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 10),
                  height: 20,
                  width: 20,
                  color: Theme.of(context).colorScheme.error.withOpacity(0.2),
                ),
            
                const Text("Epuisé"),
              ],
            ),
          )
        ],
      ),
    );
  }
}