import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:sim/controllers/stocks_controller.dart';
import 'package:sim/models/models.dart';
import 'package:sim/screens/desktop/dashbord/widgets/desktop_dashbord_mouvement_form.dart';
import 'package:sim/screens/desktop/home/widgets/desktop_left_navbar.dart';
import 'package:sim/screens/general_widgets/appbar_widget.dart';
import 'package:sim/screens/general_widgets/info_card.dart';
import 'package:sim/screens/general_widgets/nav_element.dart';
import 'package:sim/screens/general_widgets/screen_button.dart';
import 'package:sim/screens/general_widgets/screen_table.dart';
import 'package:sim/screens/general_widgets/stock_info_row.dart';
import 'package:sim/screens/general_widgets/stock_state_colors.dart';
import 'package:sim/screens/general_widgets/stock_state_indicator.dart';
import 'package:sim/screens/utils/row_action.dart';
import 'package:sim/screens/utils/utils.dart';

class DesktopStockView extends StatelessWidget {
  const DesktopStockView({super.key, required this.stockIndex, required this.stocksController});
  final int stockIndex;
  final StocksController stocksController;

  @override
  Widget build(BuildContext context) {
    stocksController.selectedArticle=stockIndex;
    Stock stock = stocksController.getcurrentStock(stockIndex);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Row(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              height: double.infinity,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
              ),
              child: CustomDesktopLeftNavigation(
                navBarOptions: [
                NavElement(title: "Tableau de bord", const Icon(Icons.dashboard_customize), onTap: (){
                  StocksController.navigateHomeScreens(context, 0);
                }),
                NavElement(title: "Stocks", const Icon(BootstrapIcons.box_fill), isSelected: true, onTap: (){
                  // StocksController.navigateHomeScreens(context, 1);
                }),
                // NavElement(title: "Rapports & Analyses",const Icon(BootstrapIcons.bar_chart_line_fill), onTap: (){
                //   StocksController.navigateHomeScreens(context, 2);
                // })
              ],),
            )),
          Expanded(
            flex: 8,
            child: Column(
              children: [
                const CustomAppBar(),
                Expanded(
                  child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              

                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                  flex: 3,
                                    child: StreamBuilder<Object>(
                                      stream: stock.changes.asBroadcastStream(),
                                      builder: (context, snapshot) {
                                        return InfoCard(
                                          content: Column(
                                            children: [
                                              StockInfoRow(infoKey: "Nom", infoValue: stock.stockName),
                                              StockInfoRow(infoKey: "Categorie", infoValue:stock.category!.title),
                                              StockInfoRow(infoKey: "Unité de mesure", infoValue: stock.measurementUnit!.title),
                                              StockInfoRow(infoKey: "Date de création", infoValue: dateFormater(date: stock.createdAt)),
                                              StockInfoRow(infoKey: "Quantité d'alerte", infoValue: stock.alerteQuantityLevel.toString())
                                            ],
                                            ), 
                                          title: "Informations générales");
                                      }
                                    ),
                                  ),
                                  
                                  const Expanded(
                                    flex: 3,
                                    child: SizedBox()),
                                  
                                  Expanded(
                                    flex: 4,
                                    child: StreamBuilder<Object>(
                                      stream: stock.changes,
                                      builder: (context, snapshot) {
                                        return InfoCard(
                                          content: Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment:CrossAxisAlignment.start ,
                                              children: [
                                                Text(
                                                  stock.quantity.toString(),
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 25,
                                                  ),
                                                ),
                                                Text("${stock.measurementUnit!.title}${stock.quantity<=1?"":"s"}"),
                                                
                                                StockStateIndicator(color: indicatorColor(stock.quantity, stock.alerteQuantityLevel, context)),
                                        
                                                const StockStateIndicatorColors()
                                        
                                              ],
                                          ), 
                                          title: "Quantité en stock");
                                      }
                                    ),
                                  ),
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
                    await showSimFormModal(context: context, form: DesktopMouvementForm(stocksController: stocksController, withArtile: false,), title: "Nouveau mouvement",onSave:(){stocksController.saveMouvement(context);});
                  })
                                ],
                              ),
                              Expanded(
                                child: StreamBuilder<Object>(
                                  stream: stocksController.getStockMouvementStream(stock),
                                  builder: (context, snapshot) {
                                    //TODO: REFRESH THE LIST
                                    return ScreenTable(
                                                      tableRows: stocksController.getStockMovementsToMap(stockIndex), 
                                                      headers: const ["Date","Référence", "Justification", "Quantité", "Status"], 
                                                      tableTitleWiget: const Text("Mouvement du stock"),
                                                      actions: [
                                                        RowAction(
                                                          "Modifier", 
                                                          Icons.edit, 
                                                          ({required selectedIndex}) => null,
                                                          ({required int selectedIndex}){
                                                            return stocksController.getStockMovements(stockIndex)[selectedIndex].status != MoveStatus.validated.index;
                                                          }
                                                          )
                                                      ],
                                                      );
                                  }
                                ),
                              )
                            
                            ],
                          
                          
                          )
                        ),
                ),],
            ),
          ) 
        ],
       ),
    );
  }

  Color indicatorColor(double currentQuantity, double alerteQuantity, BuildContext context){
    if(currentQuantity>alerteQuantity){
      return Theme.of(context).colorScheme.secondary.withOpacity(0.8);
    }else if(currentQuantity>0 && currentQuantity <= alerteQuantity){
      return Theme.of(context).colorScheme.error;
    }else{
      return Theme.of(context).colorScheme.error.withOpacity(0.2);
    }
  }
}