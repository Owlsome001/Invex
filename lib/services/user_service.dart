import 'dart:convert';
import 'package:realm/realm.dart';
import 'package:sim/controllers/app_controller.dart';
import 'package:sim/controllers/login_controller.dart';

class UserService {

  static Future<User?> login(String username, String password) async{
    String payload = jsonEncode({
      "username":username,
      "password": password
    });

    Credentials credentials = Credentials.function(payload);
    try {
      return await AppController.sim.logIn(credentials);
    } on AppException catch (e) {
      // if(e.statusCode)
     switch (e.statusCode) {
       case 997:
         LoginController.loginFormError.value = {
              "hasError":true, "errorText":"Problème d'internet"
         };
         break;
       case 401:
         Map<String, dynamic> errorMessage = jsonDecode(e.message);
         LoginController.loginFormError.value = {
              "hasError":true, "errorText":errorMessage["message"]
         };
         
         break;
       default:
        LoginController.loginFormError.value = {
              "hasError":true, "errorText":"Problème d'internet"
        };
        break;
     }
     return null;
    }
  }  
}