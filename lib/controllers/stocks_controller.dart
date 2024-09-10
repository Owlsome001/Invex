import 'dart:io';

import 'package:flutter/material.dart';
import 'package:realm/realm.dart';
import 'package:sim/controllers/app_controller.dart';
import 'package:sim/controllers/home_controller.dart';
import 'package:sim/models/models.dart';
import 'package:sim/screens/mobile/stocks/mobile_stock_view.dart';
import 'package:sim/screens/utils/utils.dart';
import 'package:sim/services/categorie_service.dart';
import 'package:sim/services/measurement_unit_service.dart';
import 'package:sim/services/stock_mouvement_service.dart';
import 'package:sim/services/stock_service.dart';

import '../screens/desktop/stocks/desktop_stock_view.dart';

class StocksController {
   final CategoryService _categoryService = CategoryService();
   final StockService _stockService = StockService();
   final MeasurementUnitService _measurementUnitService = MeasurementUnitService();
   final StockMouvementService _stockMouvementService = StockMouvementService();
   
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

   List<DropdownMenuItem<int>> stockDropdowmItems = [];
   List<Stock> dbStocks = [];

   int _selectedCategoryIndex=0;

   int _selectedMeasurementUnitIndex=0;

   int _selectedArticle=0;

  Stream<RealmResultsChanges<Stock>> get stocksStream{
    return _stockService.stocksStream;
  }

  Stream<RealmResultsChanges> get mouvementStream{
    return _stockMouvementService.movementStream;
  }

   StocksController(){
      dbCategories =_categoryService.allCategories.toList();
      categories = dbCategories.map((category) => DropdownMenuItem<int>(value: dbCategories.indexOf(category),child: Text(category.title),)).toList();

      dbUnits = _measurementUnitService.allMeasurementUnits.toList();
      units = dbUnits.map((unit) => DropdownMenuItem<int>(value: dbUnits.indexOf(unit),child: Text(unit.title),)).toList();
   
      dbStocks = _stockService.allStocks.toList();
      stockDropdowmItems = dbStocks.map((unit) => DropdownMenuItem<int>(value: dbStocks.indexOf(unit),child: Text(unit.stockName),)).toList();
   
   
   }


   List<Map<String, dynamic>> get recentMovements{
    return _stockMouvementService.allMouvements.map((mouvement) => {
      "date":dateFormater(utcDate: mouvement.recordedAt),
      "article":mouvement.stock!.stockName,
      "reference":mouvement.reference,
      "quantity":"${mouvement.moveType==0?"+":"-"} ${mouvement.quantity.toString()}", 
      "justification":mouvement.justification??"-",
      "status":displayedStatuses(mouvement.status)
    }).toList();
   }

  List<int> get stocksAvailablity{
    return [
      dbStocks.where((stock) => stock.quantity>stock.alerteQuantityLevel).length,
      dbStocks.where((stock) => stock.quantity>0&&stock.quantity<stock.alerteQuantityLevel).length,
      dbStocks.where((stock) => stock.quantity==0).length
    ];
  }

  get refreshStockDropDowItem{
      stockDropdowmItems = dbStocks.map((unit) => DropdownMenuItem<int>(value: dbStocks.indexOf(unit),child: Text(unit.stockName),)).toList();
  }
  set selectedCategoryIndex (int index){
    _selectedCategoryIndex=index;
  }

  set selectedArticle (int index){
    debugPrint("===SelectedActicle index : $index");
    _selectedArticle =index;
  }


  set selectedMeasurementUnitIndex (int index){
    _selectedMeasurementUnitIndex =index;
  }


  static void navigateToStockView(BuildContext context, int selectedIndex, StocksController controller){
    Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => !Platform.isAndroid? DesktopStockView(selectedIndex: selectedIndex,stocksController: controller,): const MobileStockView())
                    );
  }

  static void navigateHomeScreens(BuildContext context, int index){
    Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HomeController.platformHomeScreen(tabIndex: index))
                    );
  }

  void saveArticle(BuildContext context){
    AppController.formError.value = {"hasError":false, "errorText":""};
    if(validateArticleForm()){
      debugPrint("About to save the article");
      try {
        _stockService.createStock(
          Stock(ObjectId(), 
          articleNameController.text.trim(), 
          double.parse(quantityController.text.trim()),
          DateTime.now().toUtc(),
          category: dbCategories[_selectedCategoryIndex],
          measurementUnit: dbUnits[_selectedMeasurementUnitIndex] 
          ),
          
          );
        AppController.formError.value = {"hasError":false, "errorText":""};
        refreshStock();
        Navigator.of(context, rootNavigator: true).pop();
        emptyArticleFormFields();
      } on Exception catch (e) {
        debugPrint("$e");
      }
    }else{
       debugPrint("Article form is having some problems");
    }
   
  }

  bool validateArticleForm(){
    String formErrorMessage = "";
    if(articleNameController.text.isEmpty && quantityController.text.isEmpty){
      
      formErrorMessage ="Les champs \"Nom de l'article\" et le \"Niveau d'alerte\" ne doivent pas être vides";
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

  List<Map<String, dynamic>> get stocks{
    return dbStocks.map((stock) => 
      {
        "reference":"142EQP024",
        "article":stock.stockName,
        "category":stock.category!.title,
        "quantity":stock.quantity.toString(),
        "Unité de mesure":stock.measurementUnit!.title
      }
    ).toList();
  }

  void refreshStock(){
    dbStocks = _stockService.allStocks;
  }

   void emptyArticleFormFields(){
    articleNameController.clear();
    quantityController.clear();

  }


  List<Map<String, dynamic>> getStockMovement(int stockIndex){
    Stock stock = dbStocks[stockIndex];

    return _stockMouvementService.allMouvements
    .where((mouvement) => mouvement.stock!.id==stock.id)
    .map((mouvement) => 
    {
      "Date":dateFormater(utcDate: mouvement.recordedAt),
      "Référence":mouvement.reference, 
      "Justification":mouvement.justification??"-", 
      "Quantité": "${mouvement.moveType==0?"+":"-"} ${mouvement.quantity.toString()}", 
      "Status":displayedStatuses(mouvement.status)
    }).toList();
  }

   void saveMouvement(BuildContext context){
    AppController.formError.value = {"hasError":false, "errorText":""};
    if(validateMouvementForm()){
      try {
        _stockMouvementService.createMouvement(
          StockMovement(
            ObjectId(), 
            double.parse(quantityController.text.trim()),
            moveDateNotifier.value.toUtc(),
            moveReferenceController.text, 
            movementType.value,
            stock: dbStocks[_selectedArticle],
            status: movementType.value == MoveType.input.index?1:0,
            justification: movementType.value == MoveType.output.index? moveJustificatioController.text.trim():null
            ));

        AppController.formError.value = {"hasError":false, "errorText":""};
        refreshStock();
        Navigator.of(context, rootNavigator: true).pop();
        
        emptyMouvementForm();
        
      } on Exception catch (e) {
        debugPrint("$e");
      }
    }else{
       debugPrint("Mouvement form is having some problems");
    }
   
  }

  bool  validateMouvementForm(){
    String formErrorMessage = "";
    switch (movementType.value) {
      case  1:
        if(moveReferenceController.text.isEmpty&&
        moveJustificatioController.text.isEmpty&&
        quantityController.text.isEmpty){
          formErrorMessage ="Les champs \"Référence\", \"Quantité\" et le \"Justification\" ne doivent pas être vides";
          AppController.formError.value= {"hasError":true, "errorText":formErrorMessage};
          return false;
        }

        else if(moveJustificatioController.text.isEmpty&&
        quantityController.text.isEmpty){
          formErrorMessage ="Les champs \"Quantité\" et le \"Justification\" ne doivent pas être vides";
          AppController.formError.value= {"hasError":true, "errorText":formErrorMessage};
          return false;
        }

        else if(moveReferenceController.text.isEmpty&&
        quantityController.text.isEmpty){
          formErrorMessage ="Les champs \"Quantité\" et le \"Justification\" ne doivent pas être vides";
          AppController.formError.value= {"hasError":true, "errorText":formErrorMessage};
          return false;
        }


         else if(moveReferenceController.text.isEmpty&&
        moveJustificatioController.text.isEmpty){
          formErrorMessage ="Les champs \"Référence\" et le \"Justification\" ne doivent pas être vides";
          AppController.formError.value= {"hasError":true, "errorText":formErrorMessage};
          return false;
        }

        


        else if(moveReferenceController.text.isEmpty){
          formErrorMessage ="Le champ \"Référence\" ne doit pas être vide";
          AppController.formError.value= {"hasError":true, "errorText":formErrorMessage};
          return false;
        }

        
        else if(moveJustificatioController.text.isEmpty){
          formErrorMessage ="Le champ \"Justification\" ne doit pas être vide";
          AppController.formError.value= {"hasError":true, "errorText":formErrorMessage};
          return false;
        }
        
        else if(quantityController.text.isEmpty){
          formErrorMessage ="Le champ \"Quantité\" ne doit pas être vide";
          AppController.formError.value= {"hasError":true, "errorText":formErrorMessage};
          return false;
        }

        else if(double.parse(quantityController.text.trim())<=0){
          formErrorMessage ="La \"Quantité\" doit être supérieur à 0";
          AppController.formError.value= {"hasError":true, "errorText":formErrorMessage};
          return false;
        }

        else if(dbStocks[_selectedArticle].quantity<double.parse(quantityController.text.trim())){
          formErrorMessage ="Le quantité demandée n'est pas disponible en stock";
          AppController.formError.value= {"hasError":true, "errorText":formErrorMessage};
          return false;
        }else{
          return true;
        }

      case  0:

        if(moveReferenceController.text.isEmpty&&
        quantityController.text.isEmpty){
          formErrorMessage ="Les champs \"Quantité\" et le \"Justification\" ne doivent pas être vides";
          AppController.formError.value= {"hasError":true, "errorText":formErrorMessage};
          return false;
        }
        

        else if(moveReferenceController.text.isEmpty){
          formErrorMessage ="Le champ \"Référence\" ne doit pas être vide";
          AppController.formError.value= {"hasError":true, "errorText":formErrorMessage};
          return false;
        }
        
        else if(quantityController.text.isEmpty){
          formErrorMessage ="Le champ \"Quantité\" ne doit pas être vide";
          AppController.formError.value= {"hasError":true, "errorText":formErrorMessage};
          return false;
        }else{
          return true;
        }
      default:
        return false;
    }

  }

  String displayedStatuses(int status){
    switch (status) {
      case 0:
          return "En attente";
      case 1 :
          return "Validé"; 
      default:
        return "Rejeté";
    }
  }

  void emptyMouvementForm(){
      moveJustificatioController.clear();
      moveReferenceController.clear();
      quantityController.clear();
      moveDateNotifier.value = DateTime.now();
      movementType.value=MoveType.input.index;
      selectedArticle =0;
  }

  Stock getcurrentStock(index){
    return dbStocks[index];
  }
}