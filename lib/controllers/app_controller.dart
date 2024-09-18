
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:realm/realm.dart';
import 'package:sim/controllers/account_controller.dart';
import 'package:sim/controllers/home_controller.dart';
import 'package:sim/controllers/login_controller.dart';
import 'package:sim/models/models.dart' as models;
import 'package:sim/screens/general_widgets/message_screen.dart';
import 'package:sim/services/user_service.dart';

class AppController {
  static const String _appId = "sim-pzbbewi";
  static late AppConfiguration _appConfiguration;
  static late App sim;
  static Realm? simRealm;
   static ValueNotifier<Map<String, dynamic>> formError = ValueNotifier({"hasError":false, "errorText":""});
  static  final List<SchemaObject> simSchemas=[
    models.User.schema, models.Stock.schema, 
    models.StockMovement.schema, 
    models.MeasurementUnit.schema, 
    models.Category.schema];

  static Future<void> initAppController({bool fromAnIsolate=false})async {
    if (!fromAnIsolate) {
      _appConfiguration = AppConfiguration(_appId);
      sim = App(_appConfiguration);
    }else{
       sim = App.getById(_appId)!;
    }
  }

  static FlexibleSyncConfiguration  get simConfig{
     return  Configuration.flexibleSync(
      sim.currentUser!, simSchemas,
      syncErrorHandler: (SyncError error){
        debugPrint("=======> code ${error.code}");
      },
       clientResetHandler : RecoverOrDiscardUnsyncedChangesHandler(
        onBeforeReset: (beforeResetRealm){
          debugPrint("Attempting automatic client reset");
        },
        onManualResetFallback: (resetError){
          debugPrint("Automatic client reset fails");
       }),
      );
  }

  static ValueNotifier<String> initAppStep = ValueNotifier("Initialisation de l'application");

  static Future<Widget> initApp({bool afterlogin=false}) async  {
    //Check if the user is authenticated
    if(sim.currentUser==null){
      return LoginController.platformLoginScreen();
    }else{
      //As real flutter sdk is not working on web platforms then
      //we need to check if the platform is web before opening realm
      if(!kIsWeb){
        try {
            initAppStep.value ="Ouverture de la base de donnée";
            openDatabase();
          } on RealmException catch (e, trace) {
            debugPrint("$e \n $trace");
            if(e.message.contains("The following changes cannot be made in additive-only schema mode")) {
           
                // Realm.deleteRealm(simConfig.path);
                // return initApp();
           
                return const MessageScreen(errorMessage: "Cete version est obsolète, installer la nouvelle version pour continuer à utiliser l'application",); 
              
            }
           


        }
        
        if(simRealm!=null && !simRealm!.isClosed){
          declareSubscriptions();
          if(afterlogin){
            await forceSynchronization();
          }
          
          try {
            initAppStep.value ="Preparation de vos données";
            AccountController.user = UserService().user;
            initAppStep.value ="Finalisation";
            
            // if (AccountController.user!.accountExpirationDate.toLocal().isBefore(DateTime.now())) {
            //       return HomeController.platformHomeScreen();
            // }else{
            //       return const MessageScreen(errorMessage: "Compte désactivé");
            //     }

            return HomeController.platformHomeScreen();
             
          } on Exception catch (e) {
            debugPrint("===> $e");
             return const MessageScreen(errorMessage: "Données nécéssaires au fonctionnement sont indisponible",);
          }
          
        }else{
             return const MessageScreen(errorMessage: "Error de base de donnée",);
        }
        
      }else{
         return const MessageScreen(errorMessage: "La version web n'est pas encore disponible",);
      }
     
    
    }
  }

  static void openDatabase(){
    simRealm = Realm(simConfig);
  }

  static Future<void> forceSynchronization() async {
    if(simRealm!=null){
      initAppStep.value ="Synchronisation avec les Serveurs";
     await simRealm!.syncSession.waitForDownload();
     await simRealm!.syncSession.waitForUpload();
    }else{
      debugPrint("Realm is null");
    }
  }

  static void declareSubscriptions(){
    simRealm!.subscriptions.update((mutableSubscriptions) {
      mutableSubscriptions.add(simRealm!.all<models.User>(), name: "AllUsers",update: true);
      mutableSubscriptions.add(simRealm!.all<models.Stock>(), name: "AllStocks",update: true);
      mutableSubscriptions.add(simRealm!.all<models.StockMovement>(), name: "AllStockMovements",update: true);
      mutableSubscriptions.add(simRealm!.all<models.MeasurementUnit>(), name: "AllMeasurementUnits",update: true);
      mutableSubscriptions.add(simRealm!.all<models.Category>(), name:"AllCategories",update: true);
     });
  }

  
}