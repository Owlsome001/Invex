
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
       clientResetHandler : RecoverOrDiscardUnsyncedChangesHandler(onManualResetFallback: (resetError){
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
            if(e.message.contains("The following changes cannot be made in additive-only schema mode")) {
              Realm.deleteRealm(simConfig.path);
              await initApp();
              return const MessageScreen(errorMessage: "Votre version de l'application est déjà obsolète.",);
            }

        }
        
        if(simRealm!=null){
          declareSubscriptions();
          if(afterlogin){
            initAppStep.value ="Synchronisation avec les Serveurs";
            await forceSynchronization();
          }
          initAppStep.value ="Preparation de vos données";
          try {
            AccountController.user = UserService().user;
          } on Exception catch (e) {
            await forceSynchronization();
            simRealm!.close();
            await initApp();
          }
          return HomeController.platformHomeScreen();
        }else{
          return const MessageScreen(errorMessage: "",);
        }
        
      }
      return const MessageScreen(errorMessage: "",);
    
    }
  }

  static void openDatabase(){
    Configuration simConfig = Configuration.flexibleSync(
      sim.currentUser!, simSchemas,
      syncErrorHandler: (SyncError error){
        debugPrint("=======> code ${error.code}");
      },
       clientResetHandler : RecoverOrDiscardUnsyncedChangesHandler(onManualResetFallback: (resetError){
          debugPrint("Automatic client reset fails");
       }),
      );
    simRealm = Realm(simConfig);
  }

  static Future<void> forceSynchronization() async {
    if(simRealm!=null){
     await simRealm!.syncSession.waitForDownload();
     await simRealm!.syncSession.waitForUpload();
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