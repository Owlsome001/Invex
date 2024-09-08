import 'package:realm/realm.dart';
import 'package:sim/controllers/app_controller.dart';
import 'package:sim/models/models.dart';

class StockMouvementRepository {
  final Realm _realm = AppController.simRealm!;

  RealmResults<StockMovement> findAll(){
    return _realm.all<StockMovement>();
  }

  StockMovement? findOne(ObjectId id){
    // Query one stock by its Id
    return _realm.find<StockMovement>(id);
  }

  StockMovement updateOne(StockMovement stockMovement, int newStatus){
    return _realm.write((){
      //Writing the new status into the database
      stockMovement.status = newStatus;
      return stockMovement;
    });
  
  }

   StockMovement insertOne(StockMovement stockMovement){
    return _realm.write((){
      return _realm.add(stockMovement);
    });
  
  }
  
}