import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:sim/controllers/stocks_controller.dart';
import 'package:sim/screens/general_widgets/screen_table.dart';
import 'package:sim/screens/general_widgets/screen_button.dart';
import 'package:sim/screens/utils/row_action.dart';

class DesktopStocks extends StatelessWidget {
  DesktopStocks({super.key});
  final StocksController _stocksController = StocksController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ScreenButton(
                  buttonText: "Nouveau Stock", 
                  iconData: BootstrapIcons.plus_circle, 
                  onTap: (){
                    debugPrint("Nouveau Stock");
                  })
              ],
            ),
            Expanded(
              child: ScreenTable(
                tableRows: _stocksController.stocks, 
                headers: const ["Référence","Article","Categorie", "Quantité", "Unité de mesure"], 
                actions: [
                  RowAction("Details", Icons.info, (){
                    StocksController.navigateToStockView(context);
                  }),
                  RowAction("Modifier", Icons.edit, (){}),
                  RowAction("Supprimer", Icons.delete, (){})
                ],
                tableTitleWiget: SizedBox(
                  height: 30,
                  child: SearchBar(
                    elevation:  MaterialStateProperty.all<double>(0.0),
                    leading: const Icon(Icons.search),
                  ),
                )
              ),
            )
          
          ],
        
        
        )
      ),
    
    );
  }
}