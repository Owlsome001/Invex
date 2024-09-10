import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sim/controllers/app_controller.dart';
import 'package:sim/controllers/stocks_controller.dart';
import 'package:sim/screens/general_widgets/custom_dropdown_field.dart';
import 'package:sim/screens/general_widgets/custom_form_field.dart';

class StockForm extends StatelessWidget {
  const StockForm({super.key, required this.stocksController});
  final StocksController stocksController;
  @override
  Widget build(BuildContext context) {
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
          CustomFormFied(fieldName: "Catégorie", field: CustomDropDown(choices: stocksController.categories, defaultChoice: 0, onTap: (value){ if(value!=null){stocksController.selectedCategoryIndex=value;}},)),
          CustomFormFied(fieldName: "Unité de mésure", field: CustomDropDown(choices: stocksController.units, defaultChoice: 0, onTap: (value){if(value!=null){stocksController.selectedMeasurementUnitIndex=value;}},)),
          CustomFormFied(fieldName: "Niveau d'alerte", field: CustomTextFormField(fieldHint: "ex : 10.25", controller: stocksController.quantityController, borderRadius: BorderRadius.zero, inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'(^\d*\.?\d*)'))
                    ],
                    keyboardType: TextInputType.number))
        ],
      ),
    );
  }
}