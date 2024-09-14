
import 'package:flutter/material.dart';
import 'package:sim/controllers/app_controller.dart';
import 'package:sim/controllers/login_controller.dart';
import 'package:sim/models/models.dart' as models;
import 'package:sim/services/user_service.dart';

class AccountController {
  static final UserService _userService = UserService();
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

  String get userDisplayName{
    return "${user!.firstName} ${user!.lastName}";
  }

  String get avatarInitials {
    return "${user!.firstName[0].toUpperCase()}${user!.lastName[0].toUpperCase()}";
  }
  
  String get role {
    if(user!.role.toUpperCase()==models.UserRole.magasinier.name){
      return "${user!.role[0].toUpperCase()}${user!.role.substring(1).toLowerCase()}";
    }
    return "${user!.role[0].toUpperCase()}${user!.role.substring(1).toLowerCase()}".replaceAll("depot", " de depot");
  }

  static bool get isMagasinier{
    return _userService.isMagasinier;
  }

  static bool get isChefDepot{
    return _userService.isChefDepot;
  }


}