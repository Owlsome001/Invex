import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:sim/controllers/dashboard_controller.dart';
import 'package:sim/controllers/stocks_controller.dart';
import 'package:sim/screens/desktop/dashbord/widgets/desktop_dashbord_mouvement_form.dart';
import 'package:sim/screens/general_widgets/info_card.dart';
import 'package:sim/screens/general_widgets/screen_table.dart';
import 'package:sim/screens/general_widgets/screen_button.dart';
import 'package:sim/screens/general_widgets/stock_state_colors.dart';
import 'package:sim/screens/general_widgets/stock_state_indicator.dart';
import 'package:sim/screens/utils/utils.dart';

class DesktopDashbord extends StatelessWidget {
  DesktopDashbord({super.key, required this.stocksController});
  final DashbordController _controller = DashbordController();
  final StocksController stocksController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ignore: prefer_const_constructors
            Row(
              children: [
                Expanded(
                  flex: 4,
                  child: InfoCard(
                                          content: StreamBuilder<Object>(
                                            stream: stocksController.mouvementStream,
                                            builder: (context, snapshot) {
                                              stocksController.refreshStock();
                                              List<int> stocksAvailablity = stocksController.stocksAvailablity;
                                              return Column(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                crossAxisAlignment:CrossAxisAlignment.start ,
                                                  children: [
                                                    Text(
                                                          stocksController.dbStocks.length.toString(),
                                                          style: TextStyle(
                                                            color: Theme.of(context).colorScheme.onBackground,
                                                            fontWeight: FontWeight.bold,
                                                            fontSize: 25,
                                                          ),
                                                      ),
                                                    const Text("Stocks"),
                                              
                                                    Row(
                                                      children: [
                                                        //Available stocks
                                                        stocksAvailablity[0]>0?
                                                        Expanded(
                                                          flex: stocksAvailablity[0],
                                                          child: StockStateIndicator(color: Theme.of(context).colorScheme.secondary.withOpacity(0.8))):
                                                          StockStateIndicator(color: Theme.of(context).colorScheme.secondary.withOpacity(0.8)),
                                                        
                                                        // Alerte stocks
                                                        stocksAvailablity[1]>0?
                                                        Expanded(
                                                          flex: stocksAvailablity[1],
                                                          child: StockStateIndicator(color: Theme.of(context).colorScheme.error)):
                                                          
                                                          StockStateIndicator(color: Theme.of(context).colorScheme.secondary.withOpacity(0.8)),
                                                        
                                                        //Outstocked
                                                         stocksAvailablity[2]>0?
                                                        Expanded(
                                                          flex: stocksAvailablity[2],
                                                          child: StockStateIndicator(color: Theme.of(context).colorScheme.error.withOpacity(0.2))):
                                                        StockStateIndicator(color: Theme.of(context).colorScheme.error.withOpacity(0.2))
                                                        ,

                                                      ],
                                                    ),
                                              
                                                    const StockStateIndicatorColors()
                                                                
                                                  ],
                                              );
                                            }
                                          ), 
                                          title: "Stocks"),
                ),

                     const Expanded(
                      flex: 6,
                      child: SizedBox(
                     ))     
              ],
            ),
            
            
            
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ScreenButton(
                  buttonText: "Nouveau Mouvement", 
                  iconData: BootstrapIcons.clipboard2_plus, 
                  onTap: () async {
                    await showSimFormModal(
                      context: context,
                      title: "Nouveau Mouvement", 
                      form: DesktopMouvementForm(stocksController: stocksController),
                      onSave: (){
                        stocksController.saveMouvement(context);
                      }
                      );
                  })
              ],
            ),
            Expanded(
              child: StreamBuilder<Object>(
                stream: stocksController.mouvementStream,
                builder: (context, snapshot) {
                  return ScreenTable(
                    tableRows: stocksController.recentMovements, 
                    headers: const ["Date","Article","Référence", "Quantité", "Justification", "Status"], 
                    tableTitleWiget: const Text("Mouvement recents"),);
                }
              ),
            )
          
          ],
        
        
        )
      ),
    );
  }
}