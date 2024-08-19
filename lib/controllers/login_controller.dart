
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sim/screens/desktop/login/desktop_login.dart';
import 'package:sim/screens/mobile/login/mobile_login.dart';

class LoginController {
  bool passwordVisible = false;

  static Widget platformLoginScreen(){
    if(Platform.isAndroid){
      return MobileLoginScreen();
    }
    return DesktopLoginScreen();
  }
}