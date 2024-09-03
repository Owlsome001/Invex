import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:sim/controllers/stocks_controller.dart';
import 'package:sim/screens/desktop/home/widgets/desktop_left_navbar.dart';
import 'package:sim/screens/general_widgets/appbar_widget.dart';
import 'package:sim/screens/general_widgets/info_card.dart';
import 'package:sim/screens/general_widgets/nav_element.dart';
import 'package:sim/screens/general_widgets/screen_button.dart';
import 'package:sim/screens/general_widgets/screen_table.dart';
import 'package:sim/screens/general_widgets/stock_info_row.dart';
import 'package:sim/screens/general_widgets/stock_state_colors.dart';
import 'package:sim/screens/general_widgets/stock_state_indicator.dart';

class DesktopStockView extends StatelessWidget {
  DesktopStockView({super.key});
  
  final StocksController stocksController = StocksController(); 

  @override
  Widget build(BuildContext context) {
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
                NavElement(title: "Rapports & Analyses",const Icon(BootstrapIcons.bar_chart_line_fill), onTap: (){
                  StocksController.navigateHomeScreens(context, 2);
                })
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
                                    child: InfoCard(
                                      content: Column(
                                        children: [
                                          StockInfoRow(infoKey: "Nom", infoValue: "Riz"),
                                          StockInfoRow(infoKey: "Categorie", infoValue: "Nouriture"),
                                          StockInfoRow(infoKey: "Unité de mesure", infoValue: "Kilograme"),
                                          StockInfoRow(infoKey: "Date de création", infoValue: "20.07.2019"),
                                          StockInfoRow(infoKey: "Quantité d'alerte", infoValue: "1000")
                                        ],
                                        ), 
                                      title: "Informations générales"),
                                  ),
                                  
                                  Expanded(
                                    flex: 3,
                                    child: SizedBox()),
                                  
                                  Expanded(
                                    flex: 4,
                                    child: InfoCard(
                                      content: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment:CrossAxisAlignment.start ,
                                          children: [
                                            Text(
                                              "15000",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 25,
                                              ),
                                            ),
                                            Text("Kilogrames"),
                                            
                                            StockStateIndicator(color: Theme.of(context).colorScheme.secondary.withOpacity(0.8)),

                                            StockStateIndicatorColors()
                                    
                                          ],
                                      ), 
                                      title: "Quantité en stock"),
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
                    onTap: (){
                      debugPrint("Nouveau mouvement");
                    })
                                ],
                              ),
                              Expanded(
                                child: ScreenTable(
                  tableRows: stocksController.recentMovement, 
                  headers: const ["Date","Désignation", "Quantité", "Type", "Status"], 
                  tableTitleWiget: const Text("Mouvement recents"),),
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
}