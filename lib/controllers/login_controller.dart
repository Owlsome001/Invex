
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:realm/realm.dart';
import 'package:sim/controllers/app_controller.dart';
import 'package:sim/screens/desktop/login/desktop_login.dart';
import 'package:sim/screens/general_widgets/init_app_screen.dart';
import 'package:sim/screens/mobile/login/mobile_login.dart';
import 'package:sim/services/user_service.dart';

class LoginController {
  bool passwordVisible = false;
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController idController = TextEditingController();
  final _loginFormKey = GlobalKey<FormState>();

  GlobalKey<FormState> get loginFormKey => _loginFormKey;

  static final ValueNotifier<bool> isSubmiting = ValueNotifier(false);

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
    User? user = await UserService.login(idController.text, passwordController.text);
    if(user!=null){
      isSubmiting.value=false;
       Navigator.pushAndRemoveUntil(
                    _loginFormKey.currentContext!,
                    MaterialPageRoute(
                        builder: (context) => InitAppScreen(future: AppController.initApp(afterlogin: true))),
                    (route) => false);
    }
  }

}