
import 'package:flutter/material.dart';
import 'package:sim/controllers/app_controller.dart';
import 'package:sim/controllers/stocks_controller.dart';
import 'package:sim/screens/general_widgets/custom_dropdown_field.dart';
import 'package:sim/screens/general_widgets/custom_form_field.dart';
import 'package:sim/screens/general_widgets/date_picker_formfield.dart';
import 'package:sim/services/stocksheet_service.dart';

class StockSheetForm extends StatelessWidget {
  const StockSheetForm({super.key, required this.stocksController});
  final StocksController stocksController;
  @override
  Widget build(BuildContext context) {
    return Card(
      borderOnForeground: false,
      color: Theme.of(context).colorScheme.background,
      elevation: 0.0,
      child: Center(
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
            CustomFormFied(fieldName: "Date d'ouverture", field: DateTimePickerFormField(valueNotifier: stocksController.moveDateNotifier)),
            CustomFormFied(fieldName: "Date de cloture", field: DateTimePickerFormField(valueNotifier: stocksController.closingDate)),
            // CustomFormFied(fieldName: "Format", field: CustomDropDown(choices: StockSheetType.values.map((type) => DropdownMenuItem<int>(value: type.index,child: Text(type.name),)).toList() , defaultChoice: 0, onTap: (value){if(value!=null){stocksController.selectedStockSheetType=value;}},))
          ],
        ),
      ),
    );
  }
}