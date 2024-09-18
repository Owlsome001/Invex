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

  StockMovement updateOne(StockMovement stockMovement, {required int newType, required double newQuantity, required String newReference, String? newJustification}){
    MoveType currentType = MoveType.values[stockMovement.moveType];
    Stock stock = stockMovement.stock!;
    double stockQuantity = stock.quantity;
    return _realm.write((){
      //Writing the new status into the database
      stockMovement.quantity=newQuantity;
      stockMovement.reference=newReference;
      stockMovement.justification=newJustification;
      stockMovement.moveType = newType;
      if(currentType!=MoveType.values[newType] && MoveType.values[newType]==MoveType.input){
        stock.quantity+=newQuantity;
        stockMovement.quantityAfterMouvement=newQuantity+stockQuantity;
        stockMovement.status = MoveStatus.validated.index;
      }
      return stockMovement;
    });
  
  }

   StockMovement insertOne(StockMovement stockMouvement){
    // Extraction du stock liée au mouvement
    Stock  stock = stockMouvement.stock!;
    //Extraction de la quantité actuelle en stock
    double currentStock = stock.quantity;
     //Extraction de la quantité du mouvement en stock
    double quantity = stockMouvement.quantity;
    return _realm.write((){
      StockMovement savedMovement = _realm.add(stockMouvement);
      if(stockMouvement.moveType==MoveType.input.index){
         //Modification du niveau de stock
        stock.quantity = currentStock+quantity;
        //Mis a jour de l'attribut quantiteApresMvt 
        savedMovement.quantityAfterMouvement = currentStock+quantity;
      }
      return savedMovement;
    });
  
  }

  bool approveMouvement(StockMovement stockMovement) {
    Stock stock = stockMovement.stock!;
    double currentQuantity = stock.quantity;
    double quantityAfterMouvement = currentQuantity-stockMovement.quantity;
    try {
    _realm.write(() {
      //Update StockQuantity
      stock.quantity=quantityAfterMouvement;
      //Set stock [quantityAfterMouvement] attribute
      stockMovement.quantityAfterMouvement=quantityAfterMouvement;
      //Update mouvement status
      stockMovement.status = MoveStatus.validated.index;
    });
    return true;
  } on Exception {
    return false;
  }

  }

  void deleteMouvement(StockMovement mouvement) {
    _realm.write(() => _realm.delete<StockMovement>(mouvement));
  }
  
}