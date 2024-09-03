import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sim/controllers/home_controller.dart';
import 'package:sim/screens/mobile/stocks/mobile_stock_view.dart';

import '../screens/desktop/stocks/desktop_stock_view.dart';

class StocksController {
  
   final List<Map<String, dynamic>> recentMovement = [
    {
      "date":"26.08.2024",
      "article":"Acquisition 2024",
      "quantity":"10",
      "type":"Entrée",
      "status":"En attente"
    },
    {
      "date":"20.08.2024",
      "article":"Sortie pour utilisation",
      "quantity":"-200",
      "type":"Sortie",
      "status":"Validé"
    },
    {
      "date":"14.08.2024",
      "article":"Nouveau lot",
      "quantity":"+50",
      "type":"Entrée",
      "status":"En attente"
    },
    {
      "date":"20.08.2024",
      "article":"Sortie pour utilisation",
      "quantity":"-200",
      "type":"Sortie",
      "status":"Validé"
    },

    {
      "date":"26.08.2024",
      "article":"Acquisition 2024",
      "quantity":"10",
      "type":"Entrée",
      "status":"En attente"
    },
    {
      "date":"20.08.2024",
      "article":"Sortie pour utilisation",
      "quantity":"-200",
      "type":"Sortie",
      "status":"Validé"
    },
    {
      "date":"14.08.2024",
      "article":"Nouveau lot",
      "quantity":"+50",
      "type":"Entrée",
      "status":"En attente"
    },
    {
      "date":"20.08.2024",
      "article":"Sortie pour utilisation",
      "quantity":"-200",
      "type":"Sortie",
      "status":"Validé"
    }

         
  ];


  final List<Map<String, dynamic>> stocks = [  
    
    {
      "reference":"0007EQP024",
      "article":"Grenade",
      "category":"Equipement",
      "quantity":"17500",
      "Unité de mesure":"Unité",
    },


      {
      "reference":"536EQP024",
      "article":"Gillet par balle",
      "category":"Equipement",
      "quantity":"50",
      "Unité de mesure":"Unité",
    },
    
    {
      "reference":"0201NR024",
      "article":"Riz",
      "category":"Nourriture",
      "quantity":"10000",
      "Unité de mesure":"Kilogramme",
    },
    
    {
      "reference":"142EQP024",
      "article":"LandCruser",
      "category":"Equipement",
      "quantity":"15",
      "Unité de mesure":"Vehicule",
    },

    
    {
      "reference":"0007EQP024",
      "article":"Grenade",
      "category":"Equipement",
      "quantity":"17500",
      "Unité de mesure":"Unité",
    },


      {
      "reference":"536EQP024",
      "article":"Gillet par balle",
      "category":"Equipement",
      "quantity":"50",
      "Unité de mesure":"Unité",
    },
    
    {
      "reference":"0201NR024",
      "article":"Riz",
      "category":"Nourriture",
      "quantity":"10000",
      "Unité de mesure":"Kilogramme",
    },
    
    {
      "reference":"142EQP024",
      "article":"LandCruser",
      "category":"Equipement",
      "quantity":"15",
      "Unité de mesure":"Vehicule",
    },
  ];

  static void navigateToStockView(BuildContext context){
    Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => !Platform.isAndroid? DesktopStockView(): MobileStockView())
                    );
  }

  static void navigateHomeScreens(BuildContext context, int index){
    Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HomeController.platformHomeScreen(tabIndex: index))
                    );
  }
}