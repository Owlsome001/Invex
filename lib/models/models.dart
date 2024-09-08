
import 'package:realm/realm.dart';
part 'models.realm.dart';

@RealmModel()
@MapTo("Users")
class _User{
  @PrimaryKey()
  @MapTo("_id")
  late ObjectId id;
  late String username;
  late String password;
  late String role;
  late String firstName;
  late String lastName; 
  late String surname;
  late bool isActivated = true;

}


@RealmModel()
@MapTo("Stocks")
class _Stock{
  @PrimaryKey()
  @MapTo("_id")
  late ObjectId id;
  late String stockName;
  late _Category? category;
  late _MeasurementUnit? measurementUnit;
  late double quantity;
}


@RealmModel()
@MapTo("StockMovements")
class _StockMovement{
  @PrimaryKey()
  @MapTo("_id")
  late ObjectId id;
  late double quantity;
  late double quantityAfterMouvement;
  late String reference;
  late String? justification;
  late _Stock? stock;
  late _User? user;
  late int moveType;
  late int status;

}


@RealmModel()
@MapTo("Categories")
class _Category{
  @PrimaryKey()
  @MapTo("_id")
  late ObjectId id;
  late String title;
}

@RealmModel()
@MapTo("MeasurementUnits")
class _MeasurementUnit{
  @PrimaryKey()
  @MapTo("_id")
  late ObjectId id;
  late String title; 
}

