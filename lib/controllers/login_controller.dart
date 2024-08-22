
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sim/screens/desktop/login/desktop_login.dart';
import 'package:sim/screens/mobile/login/mobile_login.dart';
import 'package:sim/services/user_service.dart';

class LoginController {
  bool passwordVisible = false;
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController idController = TextEditingController();

  static ValueNotifier<Map<String, dynamic>> loginFormError = ValueNotifier({"hasError":false, "errorText":""}); 

  static Widget platformLoginScreen(){
    if(Platform.isAndroid){
      return const MobileLoginScreen();
    }
    return const DesktopLoginScreen();
  }

  bool validateForm(){
    if(passwordController.text.isEmpty||idController.text.isEmpty){
      loginFormError.value = {
        "hasError":true, "errorText":"Veuillez completer tout les champs."
      };
      debugPrint("Empty");
      return false;

    }else{
      loginFormError.value = {
        "hasError":false, "errorText":""
      };
    return true;}
  }

  Future<void> submitLoginForm() async{
    await UserService.login(idController.text, passwordController.text);
  }

}