
import 'package:flutter/material.dart';
import 'package:sim/controllers/app_controller.dart';
import 'package:sim/controllers/login_controller.dart';
import 'package:sim/models/models.dart' as models;
import 'package:sim/services/user_service.dart';

class AccountController {
  
  static models.User? user; 

  static Future<void> logOut(BuildContext context) async{
    await UserService.logOut();
     if(AppController.sim.currentUser==null){
       Navigator.pushAndRemoveUntil(
                    // ignore: use_build_context_synchronously
                    context,
                    MaterialPageRoute(
                        builder: (context) => LoginController.platformLoginScreen()),
                    (route) => false);
    }
  }

}