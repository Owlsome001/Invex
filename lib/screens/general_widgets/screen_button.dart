import 'package:flutter/material.dart';

class ScreenButton extends StatelessWidget {
  const ScreenButton({super.key, required this.buttonText, required this.iconData, required this.onTap});
  final String buttonText;
  final IconData iconData;
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
                  onPressed:(){
                    onTap();
                  }, 
                  icon: Icon(
                    iconData,
                    color:Theme.of(context).colorScheme.surface,
                    )
                  , 
                  label: Text(
                    buttonText,
                    style: TextStyle(color: Theme.of(context).colorScheme.surface),
                    ),
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all<Color>(Theme.of(context).colorScheme.secondary),
                  ) ,
                  );
  }
}