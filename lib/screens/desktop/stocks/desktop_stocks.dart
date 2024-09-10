import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:sim/controllers/stocks_controller.dart';
import 'package:sim/screens/desktop/stocks/widgets/stock_form.dart';
import 'package:sim/screens/desktop/stocks/widgets/stock_sheet_form.dart';
import 'package:sim/screens/general_widgets/screen_table.dart';
import 'package:sim/screens/general_widgets/screen_button.dart';
import 'package:sim/screens/utils/row_action.dart';
import 'package:sim/screens/utils/utils.dart';

class DesktopStocks extends StatelessWidget {
  const DesktopStocks({super.key, required this.stocksController});
  final StocksController stocksController;
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
                  buttonText: "Nouveau article", 
                  iconData: BootstrapIcons.plus_circle, 
                  onTap: () async {
                    await showSimFormModal(
                      context: context, form: StockForm(stocksController: stocksController ,) , 
                      title: "Nouveau article", onSave:()=>stocksController.saveArticle(context));
                  })
              ],
            ),
            Expanded(
              child: StreamBuilder<Object>(
                stream: stocksController.stocksStream.asBroadcastStream(),
                builder: (context, snapshot) {
                  if(snapshot.hasData){
                    stocksController.refreshStock();
                  }
                  return ScreenTable(
                    tableRows: stocksController.stocks, 
                    headers: const ["Référence","Article","Categorie", "Quantité", "Unité de mesure"], 
                    actions: [
                      RowAction("Details", Icons.info, ({required int selectedIndex}){
                        StocksController.navigateToStockView(context, selectedIndex, stocksController);
                      }),
                      RowAction("Modifier", Icons.edit, ({required int selectedIndex}) async {
                        await showSimFormModal(context: context, form: StockForm(stocksController: stocksController), title: "Modifier l'article", onSave: (){});
                      }),
                      RowAction("Rapport", Icons.receipt, ({required int selectedIndex}) async {
                        await showSimFormModal(context: context, form: StockSheetForm(stocksController: stocksController), title: "Générer fiche de stock", onSave: (){});
                      })
                    ],
                    tableTitleWiget: SizedBox(
                      height: 30,
                      child: SearchBar(
                        elevation:  MaterialStateProperty.all<double>(0.0),
                        leading: const Icon(Icons.search),
                      ),
                    )
                  );
                }
              ),
            )
          
          ],
        
        
        )
      ),
    
    );
  }
}