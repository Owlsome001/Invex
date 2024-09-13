import 'package:realm/realm.dart';
import 'package:sim/models/models.dart';
import 'package:sim/repositories/stock_repository.dart';

class StockService {
  final StockRepository _stockRepository = StockRepository();

  List<Stock> get allStocks{
    return _stockRepository.findAll().toList();
  }  


  Stream<RealmResultsChanges<Stock>> get stocksStream{
    return _stockRepository.findAll().changes;
  }  

  Stock createStock(Stock stock){
    return _stockRepository.insertOne(stock);
  }

  Stock? findById(ObjectId objectId) {
    return _stockRepository.findOne(objectId);
  } 
}