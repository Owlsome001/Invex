import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sim/controllers/app_controller.dart';
import 'package:sim/controllers/home_controller.dart';
import 'package:sim/models/models.dart';
import 'package:sim/screens/mobile/stocks/mobile_stock_view.dart';
import 'package:sim/services/categorie_service.dart';
import 'package:sim/services/measurement_unit_service.dart';

import '../screens/desktop/stocks/desktop_stock_view.dart';

class StocksController {
   final CategoryService _categoryService = CategoryService();
   final MeasurementUnitService _measurementUnitService = MeasurementUnitService();
   ValueNotifier<int> movementType = ValueNotifier(0);
   TextEditingController quantityController = TextEditingController();
   TextEditingController articleNameController = TextEditingController();
   TextEditingController moveReferenceController = TextEditingController();
   TextEditingController moveJustificatioController = TextEditingController();
   ValueNotifier<DateTime> moveDateNotifier= ValueNotifier(DateTime.now());
  
   List<DropdownMenuItem<int>> categories = [];
   List<Category> dbCategories = [];

   List<DropdownMenuItem<int>> units = [];
   List<MeasurementUnit> dbUnits= [];

   StocksController(){
      dbCategories =_categoryService.allCategories.toList();
      categories = dbCategories.map((category) => DropdownMenuItem<int>(value: dbCategories.indexOf(category),child: Text(category.title),)).toList();

      dbUnits = _measurementUnitService.allMeasurementUnits.toList();
      units = dbUnits.map((unit) => DropdownMenuItem<int>(value: dbUnits.indexOf(unit),child: Text(unit.title),)).toList();
   }

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
                        builder: (context) => !Platform.isAndroid? DesktopStockView(): const MobileStockView())
                    );
  }

  static void navigateHomeScreens(BuildContext context, int index){
    Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HomeController.platformHomeScreen(tabIndex: index))
                    );
  }

  void saveArticle(){
    AppController.formError.value = {"hasError":false, "errorText":""};
    if(validateArticleForm()){
      debugPrint("About to save the article");
    }else{
       debugPrint("Article form is having some problems");
    }
   
  }

  bool validateArticleForm(){
    String formErrorMessage = "";
    if(articleNameController.text.isEmpty && quantityController.text.isEmpty){
      
      formErrorMessage ="Le champs \"Nom de l'article\" et le \"Niveau d'alerte\" ne doivent pas être vides";
      AppController.formError.value= {"hasError":true, "errorText":formErrorMessage};
      return false;
    }else if(articleNameController.text.isEmpty){
      formErrorMessage ="Le champs \"Nom de l'article\" ne doit pas être vide";
      AppController.formError.value= {"hasError":true, "errorText":formErrorMessage};
      return false;
    }else if(quantityController.text.isEmpty){
       formErrorMessage ="Le champs \"Niveau d'alerte\" ne doit pas être vide";
       AppController.formError.value= {"hasError":true, "errorText":formErrorMessage};
      return false;
    }else if(double.parse(quantityController.text)<=0){
       formErrorMessage ="Le \"Niveau d'alerte\" doit être supéieur à 0";
       AppController.formError.value= {"hasError":true, "errorText":formErrorMessage};
      return false;
    }
    return true;
  }
}