
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:realm/realm.dart';
import 'package:sim/controllers/home_controller.dart';
import 'package:sim/controllers/login_controller.dart';
import 'package:sim/models/models.dart' as models;
import 'package:sim/screens/general_widgets/message_screen.dart';

class AppController {
  static const String _appId = "sim-pzbbewi";
  static late AppConfiguration _appConfiguration;
  static late App sim;
  static Realm? simRealm;
  static  final List<SchemaObject> simSchemas=[
    models.User.schema, models.Stock.schema, 
    models.StockMovement.schema, 
    models.MeasurementUnit.schema, 
    models.Category.schema];

  static Future<void> initAppController()async {
    _appConfiguration = AppConfiguration(_appId);
    sim = App(_appConfiguration);
  }

  static Future<Widget> initApp() async  {
    //Check if the user is authenticated
    if(sim.currentUser==null){
      return LoginController.platformLoginScreen();
    }else{
      //As real flutter sdk is not working on web platforms then
      //we need to check if the platform is web before opening realm
      if(!kIsWeb){
        try {
            openDatabase();
          } on Exception catch (e, trace) {
            debugPrint("$e\n$trace");
            return const MessageScreen();
        }
        if(simRealm!=null){
          declareSubscriptions();
        }else{
          return const MessageScreen();
        }
        return HomeController.platformHomeScreen();
      }
      return const MessageScreen();
    
    }
  }

  static void openDatabase(){
    Configuration simConfig = Configuration.flexibleSync(sim.currentUser!, simSchemas);
    simRealm = Realm(simConfig);
  }

  static void declareSubscriptions(){
    simRealm!.subscriptions.update((mutableSubscriptions) {
      mutableSubscriptions.add(simRealm!.all<models.User>(), name: "AllUsers");
      mutableSubscriptions.add(simRealm!.all<models.Stock>(), name: "AllStocks");
      mutableSubscriptions.add(simRealm!.all<models.StockMovement>(), name: "AllStockMovements");
      mutableSubscriptions.add(simRealm!.all<models.MeasurementUnit>(), name: "AllMeasurementUnits");
      mutableSubscriptions.add(simRealm!.all<models.Category>(), name:"AllCategories");
     });
  }

  
}