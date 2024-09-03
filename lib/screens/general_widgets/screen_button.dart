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
                    color:Theme.of(context).colorScheme.background,
                    )
                  , 
                  label: Text(
                    buttonText,
                    style: TextStyle(color: Theme.of(context).colorScheme.background),
                    ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Theme.of(context).colorScheme.secondary),
                  ) ,
                  );
  }
}