import 'package:flutter/material.dart';
import 'package:sim/controllers/app_controller.dart';

class SimDialog extends StatelessWidget {
  const SimDialog({super.key, required this.title, required this.content, required this.actions});
  final String title;
  final Widget content;
  final List<DialogAction> actions;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: content,
      actions: [ 
        TextButton(
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all<Color>(Theme.of(context).colorScheme.error)
          ),
          onPressed: (){
            Navigator.of(context, rootNavigator: true).pop();
          }, 
          child: Text(
            "Annuler",
            style: TextStyle(
              color: Theme.of(context).colorScheme.surface
            ),
            )),
        ...actions.map((action) => TextButton(
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all<Color>(Theme.of(context).colorScheme.secondary)
          ),
          onPressed: ()=>action.onTap(), 
          child: Text(
            action.title,
            style: TextStyle(
              color: Theme.of(context).colorScheme.surface
            ),
            ))),

        ValueListenableBuilder(valueListenable: AppController.formError, builder: (context, value, child){
          
          if(value["hasError"]){
            return Text(value[value.keys.last]);
          }else{
            return const SizedBox();
          }
        })

        ],
    );
  }
}

class DialogAction {
  final String title;
  final Function onTap;

  DialogAction({required this.title, required this.onTap});  
}