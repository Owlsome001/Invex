import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sim/controllers/app_controller.dart';
import 'package:sim/controllers/stocks_controller.dart';
import 'package:sim/models/models.dart';
import 'package:sim/screens/general_widgets/custom_dropdown_field.dart';
import 'package:sim/screens/general_widgets/custom_form_field.dart';
import 'package:sim/screens/general_widgets/date_picker_formfield.dart';
import 'package:sim/screens/general_widgets/move_type_field.dart';

class DesktopMouvementForm extends StatelessWidget {
  const DesktopMouvementForm({super.key, required this.stocksController, this.withArtile=true, this.stockMovement});
  final StocksController stocksController;
  final bool withArtile;
  final StockMovement? stockMovement;
  

  @override
  Widget build(BuildContext context) {
    stocksController.refreshStockDropDowItem;
    if(stockMovement!=null){
      stocksController.selectedArticle = stocksController.dbStocks.indexOf(stocksController.dbStocks.where((stock) => stock.id==stockMovement!.stock!.id).first);
      stocksController.mouvementType.value = MoveType.values[stockMovement!.moveType].index;
      stocksController.moveJustificatioController.text = stockMovement!.justification??"";
      stocksController.moveReferenceController.text = stockMovement!.reference;
      stocksController.quantityController.text = stockMovement!.quantity.toString();
    }
    return Card(
      borderOnForeground: false,
      color: Theme.of(context).colorScheme.surface,
      elevation: 0.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: ValueListenableBuilder<Map<String, dynamic>>(
                      valueListenable: AppController.formError, builder: (context,value, child){
                        if(value["hasError"]){
                          return Center(
                            child: Text(
                              value["errorText"],
                              style: const TextStyle(
                                color: Colors.red
                              ),
                              ),
                          
                          );
                        }
                        return const SizedBox();
                      }),
          ),
          CustomFormFied(field: MouvementTypeFormField(movementTypeNotifier: stocksController.mouvementType,), fieldName: 'Type transaction',),
          withArtile && stockMovement==null? CustomFormFied(fieldName: "Article", field: CustomDropDown(choices: stocksController.stockDropdowmItems , defaultChoice: 0, onTap: (value){if(value!=null){stocksController.selectedArticle=value;}},)):const SizedBox(),
          CustomFormFied(fieldName: "Référence", field: CustomTextFormField(fieldHint: "ex : Commande MDNA-C", controller: stocksController.moveReferenceController, borderRadius: BorderRadius.zero)),
          CustomFormFied(fieldName: "Quantité", field: CustomTextFormField(fieldHint: "ex : 10.25", controller: stocksController.quantityController, borderRadius: BorderRadius.zero,
          inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'(^\d*\.?\d*)'))
                    ],
                    keyboardType: TextInputType.number
          )),
          ValueListenableBuilder<int>(valueListenable: stocksController.mouvementType, builder:(context, value, widget) {
            if (value==1) {
              return CustomFormFied(fieldName: "Justification", field: CustomTextFormField(fieldHint: "ex : RAV CL I", controller: stocksController.moveJustificatioController, borderRadius: BorderRadius.zero,));
            }
            return const SizedBox();
            }),
          stockMovement==null? CustomFormFied(fieldName: "Date", field: DateTimePickerFormField(valueNotifier: stocksController.moveDateNotifier)): const SizedBox()

        ],
      ),
    );
  }
}