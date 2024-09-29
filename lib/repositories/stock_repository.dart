import 'package:realm/realm.dart';
import 'package:sim/controllers/app_controller.dart';
import 'package:sim/models/models.dart' as models;

class StockRepository {
  final Realm _realm = AppController.simRealm!;

  RealmResults<models.Stock> findAll(){
    return _realm.all<models.Stock>();
  }

  models.Stock? findOne(ObjectId id){
    return _realm.find<models.Stock>(id);
  }

  models.Stock updateOne(models.Stock stock, {required String stockName, required models.MeasurementUnit measurementUnit, required models.Category category, double? alertQuantity}){
    double stockAlerteQuantityLevel = stock.alerteQuantityLevel;
    return _realm.write((){
      //Writing the new status into the database
     stock.stockName=stockName;
     stock.measurementUnit=measurementUnit;
     stock.category = category;
     stock.alerteQuantityLevel=alertQuantity??stockAlerteQuantityLevel;
     return stock;
    });
  
  }

  models.Stock insertOne(models.Stock stock){
    return _realm.write((){
      return _realm.add(stock);
    });
  
  }
 
}