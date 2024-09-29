import 'package:flutter/material.dart';
import 'package:sim/models/models.dart';
import 'package:sim/screens/general_widgets/stock_info_row.dart';
import 'package:sim/screens/utils/utils.dart';

class MouvementConfirmationCard extends StatelessWidget {
  const MouvementConfirmationCard({super.key, required this.stockMovement});
  final StockMovement stockMovement;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      margin: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Voulez-vous vraiment valider la sortie de (-${stockMovement.quantity}) dans le stock ${stockMovement.stock?.stockName}",
            style: const TextStyle(
              fontSize: 15
            ),
            ),
          Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Détails"),
               Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 10),
                 child: Column(
                  children: [
                    StockInfoRow(infoKey: "Nom de l'article", infoValue: stockMovement.stock!.stockName),
                    StockInfoRow(infoKey: "Quantité", infoValue: "-${stockMovement.quantity}"),
                    StockInfoRow(infoKey: "Date d'enregistrement", infoValue: dateFormater(date: stockMovement.recordedAt))
                  ],
                 ),
               )

              ],
            ),
          )
        ],
      ),
    );
  }
}