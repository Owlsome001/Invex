import 'package:flutter/material.dart';
import 'package:sim/controllers/home_controller.dart';
import 'package:sim/screens/general_widgets/appbar_widget.dart';
import 'package:sim/screens/general_widgets/profile_card_with_avatar.dart';

class CustomMobileAppBard extends StatelessWidget  implements PreferredSizeWidget{
  const CustomMobileAppBard({super.key, required this.tabIndex});
  final int tabIndex;

  @override
  Widget build(BuildContext context) {
    return AppBar(
        leading: Container(
          margin: const EdgeInsets.only(left: 20),
          child: Image.asset(
                  'assets/images/logo.png',
                ),
        ),
        actions: const [
          AvatarCard()
        ],

        title: Builder(
          builder: (context) {
            String value="";
            switch (tabIndex) {
              case 0:
                value="Tableau de bord";
                break;
              case 1:
                value="Stocks";
                break;
              case 2:
                value="Rapports et Analyses";
                break;
              case 3:
                value="Paramètres";
                break;
              default:
                value ="";
                break;
            }
            return Text(
              value,
              style: const TextStyle(fontSize: 16),
              );
          }
        ),

        centerTitle: true,
      );
  }
  
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}