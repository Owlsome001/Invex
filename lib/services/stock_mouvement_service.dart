import 'package:realm/realm.dart';
import 'package:sim/controllers/account_controller.dart';
import 'package:sim/models/models.dart';
import 'package:sim/repositories/stock_movement_repository.dart';

class StockMouvementService {
  final StockMouvementRepository _stockMouvementRepository = StockMouvementRepository();

  List<StockMovement> get allMouvements{
    return _stockMouvementRepository.findAll().toList();
  }

  StockMovement createMouvement(StockMovement stockMovement){
      stockMovement.createdBy=AccountController.user;
      return _stockMouvementRepository.insertOne(stockMovement);
  }

  StockMovement updateMouvement(StockMovement stockMovement, {required String reference, required double quantity, String? justification, required int moveType}){
      return _stockMouvementRepository.updateOne(stockMovement, newReference: reference, newQuantity: quantity, newType: moveType, newJustification: justification);
  }

 Stream<RealmResultsChanges<StockMovement>> get movementStream{
  return _stockMouvementRepository.findAll().changes;
 }

  bool approveMouvement(StockMovement stockMovement) {
    if(stockMovement.quantity>stockMovement.stock!.quantity){
      return false;
    }else{
      return _stockMouvementRepository.approveMouvement(stockMovement);
    }
  }


  double getStockQuantityBeforeMove(StockMovement stockMovement){
    if (stockMovement.moveType == MoveType.input.index) {
     return stockMovement.quantityAfterMouvement!-stockMovement.quantity;
    } else {
       return stockMovement.quantityAfterMouvement!+stockMovement.quantity;
    }
  }

  Stream<RealmResultsChanges<StockMovement>> getStockMouvementStream(Stock stock) {
    return stock.getBacklinks<StockMovement>("stock").changes;
  }
}