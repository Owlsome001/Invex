import 'package:flutter/material.dart';
import 'package:sim/controllers/stocks_controller.dart';
import 'package:sim/screens/general_widgets/custom_dropdown_field.dart';
import 'package:sim/screens/general_widgets/custom_form_field.dart';
import 'package:sim/screens/general_widgets/date_picker_formfield.dart';
import 'package:sim/screens/general_widgets/move_type_field.dart';

class DesktopMouvementForm extends StatelessWidget {
  const DesktopMouvementForm({super.key, required this.stocksController, this.withArtile=true});
  final StocksController stocksController;
  final bool withArtile;
  

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
          CustomFormFied(field: MouvementTypeFormField(movementTypeNotifier: stocksController.movementType,), fieldName: 'Type transaction',),
          withArtile? CustomFormFied(fieldName: "Article", field: CustomDropDown(choices: const [DropdownMenuItem<int>(value: 0,child: Text("Selectionne un article"),)], defaultChoice: 0, onTap: (value){},)):const SizedBox(),
          CustomFormFied(fieldName: "Quantité", field: CustomTextFormField(fieldHint: "ex : 10.25", controller: stocksController.quantityController, borderRadius: BorderRadius.zero,)),
          CustomFormFied(fieldName: "Date", field: DateTimePickerFormField(valueNotifier: stocksController.moveDateNotifier))
        ],
      ),
    );
  }
}