import 'package:flutter/material.dart';
import 'package:sim/controllers/home_controller.dart';
import 'package:sim/screens/general_widgets/profile_card_with_avatar.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding:const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onPrimary,
        border: Border(bottom: BorderSide(color: Theme.of(context).colorScheme.onBackground.withOpacity(0.2)))
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ValueListenableBuilder(
            valueListenable: HomeController.desktopAppBarTitle,
            builder: (context, value, widget)=>Text(value),
          ),
          const AvatarCard()
        ],
      ),
    );
  }
}