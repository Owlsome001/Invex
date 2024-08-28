import 'package:flutter/material.dart';
import 'package:sim/controllers/account_controller.dart';
import 'package:sim/controllers/app_controller.dart';

class DesktopHomeScreen extends StatelessWidget {
  const DesktopHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child:Column(
          children: [
            Text(
              "${AccountController.user?.firstName} ${AccountController.user?.lastName}"
              ),

              Text(
              "${AccountController.user?.role.toLowerCase()}"
              ),

              Text(
              "${AccountController.user?.password}"
              )


          ],) ,),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.logout_rounded, color: Colors.white,),
        onPressed:() async {
          await AccountController.logOut(context);
        }),
    );
  }
}