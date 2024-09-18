import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:sim/controllers/fixed_assets_controller.dart';
import 'package:sim/screens/general_widgets/screen_button.dart';
import 'package:sim/screens/general_widgets/screen_table.dart';
import 'package:sim/screens/utils/row_action.dart';
import 'package:sim/screens/utils/utils.dart';

class FixedAssets extends StatelessWidget {
  FixedAssets({super.key});
  final FixedAssetsController _fixedAssetsController = FixedAssetsController();
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
                  buttonText: "Nouvel immobilisaion", 
                  iconData: BootstrapIcons.plus_circle, 
                  onTap: () async {
                    await showSimFormModal(
                      context: context, form: Text("Test"), 
                      title: "Nouvel immobilisation", onSave:(){});
                  })
              ],
            ),
            Expanded(
              child: StreamBuilder<Object>(
                stream: null,
                builder: (context, snapshot) {
                  if(snapshot.hasData){
                    // stocksController.refreshStock();
                  }
                  return ScreenTable(
                    tableRows: _fixedAssetsController.fixedAssets, 
                    headers: const ["Date d'acquisition","Nom","Valeur d'acquisition", "Valueur residuelle", "Type","Etat"], 
                    actions: [
                      RowAction("Details", Icons.info, ({required int selectedIndex}){
                      
                      },
                      ({required int selectedIndex})=>true
                      ),
                      RowAction("Modifier", Icons.edit, ({required int selectedIndex}) async {
                       
                      },
                      ({required int selectedIndex})=>true
                      ),
                      RowAction("Fiche d'amortissement", Icons.receipt, ({required int selectedIndex}) async {
                        await showSimFormModal(
                          context: context, 
                          form: Text("Test"), 
                          title: "Générer fiche de stock", 
                          onSave: () async{
                          
                          });
                      },
                      ({required int selectedIndex})=>true
                      )
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