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

   StockMovement insertOne(StockMovement stockMouvement){
    //Extracting the movement stock
    Stock  stock = stockMouvement.stock!;
    //Extacting the current stock quantity
    double currentStock = stock.quantity;
    double quantity = stockMouvement.quantity;
    return _realm.write((){
      StockMovement savedMovement = _realm.add(stockMouvement);
      if(stockMouvement.moveType==MoveType.input.index){
        //Update stockQuantity as input move are always validated
        stock.quantity = currentStock+quantity;
        //Set quantityafterMouvement in the mouvement document
        savedMovement.quantityAfterMouvement = currentStock+quantity;
      }
      return savedMovement;
    });
  
  }
  
}