import 'package:realm/realm.dart';
import 'package:sim/models/models.dart';
import 'package:sim/repositories/stock_movement_repository.dart';

class StockMouvementService {
  final StockMouvementRepository _stockMouvementRepository = StockMouvementRepository();

  List<StockMovement> get allMouvements{
    return _stockMouvementRepository.findAll().toList();
  }

  StockMovement createMouvement(StockMovement stockMovement){
      return _stockMouvementRepository.insertOne(stockMovement);
  }

 Stream<RealmResultsChanges<StockMovement>> get movementStream{
  return _stockMouvementRepository.findAll().changes;
 }
}