import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sim/controllers/account_controller.dart';
import 'package:sim/controllers/app_controller.dart';
import 'package:sim/controllers/stocks_controller.dart';
import 'package:sim/models/models.dart';
import 'package:sim/screens/general_widgets/custom_dropdown_field.dart';
import 'package:sim/screens/general_widgets/custom_form_field.dart';

class StockForm extends StatelessWidget {
  const StockForm({super.key, required this.stocksController, this.stock});
  final StocksController stocksController;
  final Stock? stock;
  @override
  Widget build(BuildContext context) {
    if(stock!=null){
      stocksController.articleNameController.text = stock!.stockName;
      stocksController.quantityController.text = stock!.alerteQuantityLevel.toString();
    }
    return Card(
      borderOnForeground: false,
      color: Theme.of(context).colorScheme.background,
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

          CustomFormFied(fieldName: "Nom de l'article", field: CustomTextFormField(fieldHint: "ex : Sardine", controller: stocksController.articleNameController, borderRadius: BorderRadius.zero,)),
          CustomFormFied(fieldName: "Catégorie", field: CustomDropDown(
            choices: stocksController.categories, 
            defaultChoice: stock!=null?stocksController
              .dbCategories.indexOf(stocksController.dbCategories.
              where((cat) => cat.id==stock!.category!.id).first):0 , 
            onTap: (value){ if(value!=null){stocksController.selectedCategoryIndex=value;}},)),
          CustomFormFied(fieldName: "Unité de mésure", field: CustomDropDown(choices: stocksController.units, defaultChoice: stock!=null?stocksController
              .dbUnits.indexOf(stocksController.dbUnits.
              where((unit) => unit.id==stock!.measurementUnit!.id).first):0 , onTap: (value){if(value!=null){stocksController.selectedMeasurementUnitIndex=value;}},)),
          AccountController.isChefDepot? CustomFormFied(fieldName: "Niveau d'alerte", field: CustomTextFormField(fieldHint: "ex : 10.25", controller: stocksController.quantityController, borderRadius: BorderRadius.zero, inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'(^\d*\.?\d*)'))
                    ],
                    keyboardType: TextInputType.number)): const SizedBox()
        ],
      ),
    );
  }
}