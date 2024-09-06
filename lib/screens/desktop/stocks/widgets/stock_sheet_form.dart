
import 'package:flutter/material.dart';
import 'package:sim/controllers/stocks_controller.dart';
import 'package:sim/screens/general_widgets/custom_dropdown_field.dart';
import 'package:sim/screens/general_widgets/custom_form_field.dart';
import 'package:sim/screens/general_widgets/date_picker_formfield.dart';

class StockSheetForm extends StatelessWidget {
  const StockSheetForm({super.key, required this.stocksController});
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
          CustomFormFied(fieldName: "Date d'ouverture", field: DateTimePickerFormField(valueNotifier: stocksController.moveDateNotifier)),
          CustomFormFied(fieldName: "Date de cloture", field: DateTimePickerFormField(valueNotifier: stocksController.moveDateNotifier)),
          CustomFormFied(fieldName: "Format", field: CustomDropDown(choices: const [DropdownMenuItem<int>(value: 0,child: Text("PDF"),),DropdownMenuItem<int>(value: 1,child: Text("EXCEL"),)], defaultChoice: 0, onTap: (value){},))
        ],
      ),
    );
  }
}