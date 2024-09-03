import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sim/controllers/dashboard_controller.dart';
import 'package:sim/screens/general_widgets/info_card.dart';
import 'package:sim/screens/general_widgets/screen_table.dart';
import 'package:sim/screens/general_widgets/screen_button.dart';
import 'package:sim/screens/general_widgets/stock_state_colors.dart';
import 'package:sim/screens/general_widgets/stock_state_indicator.dart';

class DesktopDashbord extends StatelessWidget {
  DesktopDashbord({super.key});
  final DashbordController _controller = DashbordController();
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
                                          content: Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment:CrossAxisAlignment.start ,
                                              children: [
                                                const Text(
                                                  "15000",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 25,
                                                  ),
                                                ),
                                                const Text("Kilogrames"),

                                                Row(
                                                  children: [
                                                    Expanded(
                                                      flex: 2,
                                                      child: StockStateIndicator(color: Theme.of(context).colorScheme.secondary.withOpacity(0.8))),
                                                    Expanded(
                                                      child: StockStateIndicator(color: Theme.of(context).colorScheme.error)),
                                                    Expanded(child: StockStateIndicator(color: Theme.of(context).colorScheme.error.withOpacity(0.2))),
                                                  ],
                                                ),

                                                const StockStateIndicatorColors()
                  
                                              ],
                                          ), 
                                          title: "Quantité en stock"),
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
                  onTap: (){
                    debugPrint("Nouveau mouvement");
                  })
              ],
            ),
            Expanded(
              child: ScreenTable(
                tableRows: _controller.recentMovement, 
                headers: const ["Date","Désignation","Catégorie", "Quantité", "Type", "Status"], 
                tableTitleWiget: const Text("Mouvement recents"),),
            )
          
          ],
        
        
        )
      ),
    );
  }
}