import 'package:flutter/foundation.dart';
import 'package:realm/realm.dart';
import 'package:sim/models/models.dart' as models;
import 'package:sim/repositories/stock_repository.dart';

class StockService {
  final StockRepository _stockRepository = StockRepository();

  List<models.Stock> get allStocks{
    return _stockRepository.findAll().toList();
  }  


  Stream<RealmResultsChanges<models.Stock>> get stocksStream{
    return _stockRepository.findAll().changes;
  }  

  models.Stock createStock(models.Stock stock){
    return _stockRepository.insertOne(stock);
  }

  models.Stock? findById(ObjectId objectId) {
    return _stockRepository.findOne(objectId);
  }

  models.Stock updateStock(models.Stock stock,{required models.Category category, double? alertQuantity, required models.MeasurementUnit measurementUnit, required String name}) {
    return _stockRepository.updateOne(stock, stockName: name, measurementUnit: measurementUnit, category: category, alertQuantity: alertQuantity);
  } 
}