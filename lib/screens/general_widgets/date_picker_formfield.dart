import 'package:flutter/material.dart';

class DateTimePickerFormField extends StatelessWidget {
  const DateTimePickerFormField({super.key, required this.valueNotifier});
  final ValueNotifier<DateTime> valueNotifier;
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: valueNotifier,
      builder: (context, value, child){
        return  GestureDetector(
          onTap: () async{
            DateTime? selectedDate = await showDatePicker(context: context, firstDate: DateTime.now().subtract( const Duration(days: 30)), lastDate: DateTime.now());
            if(selectedDate!=null){
              valueNotifier.value=selectedDate;
            }
          },
          child: Container(
            width: double.infinity,
            padding: const  EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary.withOpacity(0.3)
            
            ),
          
            child: Text("${value.day<10?0:""}${value.day}.${value.month<10?0:""}${value.month}.${value.year}"),
          ),
        );
      },
      
      );
  }
}