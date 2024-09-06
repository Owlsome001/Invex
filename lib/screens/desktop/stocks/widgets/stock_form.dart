import 'package:flutter/material.dart';
import 'package:sim/controllers/stocks_controller.dart';
import 'package:sim/screens/general_widgets/custom_dropdown_field.dart';
import 'package:sim/screens/general_widgets/custom_form_field.dart';
import 'package:sim/screens/general_widgets/date_picker_formfield.dart';
import 'package:sim/screens/general_widgets/move_type_field.dart';

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
          CustomFormFied(fieldName: "Nom de l'article", field: CustomTextFormField(fieldHint: "ex : Sardine", controller: stocksController.articleNameController, borderRadius: BorderRadius.zero,)),
          CustomFormFied(fieldName: "Catégorie", field: CustomDropDown(choices: const [DropdownMenuItem<int>(value: 0,child: Text("Nouriture"),)], defaultChoice: 0, onTap: (value){},)),
          CustomFormFied(fieldName: "Unité de mésure", field: CustomDropDown(choices: const [DropdownMenuItem<int>(value: 0,child: Text("Carton"),)], defaultChoice: 0, onTap: (value){},))
        ],
      ),
    );
  }
}