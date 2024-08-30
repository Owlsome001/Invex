
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sim/screens/desktop/home/desktop_home.dart';
import 'package:sim/screens/mobile/home/mobile_home.dart';

class HomeController {
    
    static ValueNotifier<String> desktopAppBarTitle = ValueNotifier("Tableau de bord");
    
    static Widget platformHomeScreen(){
    if(Platform.isAndroid){
      return const MobileHomeScreen();
    }
    return const DesktopHomeScreen();
  }
}