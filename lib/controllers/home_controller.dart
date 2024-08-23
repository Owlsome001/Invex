
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sim/screens/desktop/desktop_home.dart';
import 'package:sim/screens/mobile/mobile_home.dart';

class HomeController {
    
    
    static Widget platformHomeScreen(){
    if(Platform.isAndroid){
      return const MobileHomeScreen();
    }
    return const DesktopHomeScreen();
  }
}