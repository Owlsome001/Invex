
import 'package:realm/realm.dart';
part 'models.realm.dart';

enum MoveType{
  input, output
}

enum MoveStatus{
  pending, validated, rejected
}

enum UserRole {
  magasinier, chefDepot
}

@RealmModel()
@MapTo("Users")
class _User{
  @PrimaryKey()
  @MapTo("_id")
  late ObjectId id;
  @Indexed()
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
  @Indexed()
  late String stockName;
  late _Category? category;
  late double alerteQuantityLevel=1.0;
  late _MeasurementUnit? measurementUnit;
  late double quantity = 0.0;
  late DateTime createdAt;
  late _User? createdBy;
  late DateTime? updatedAt;
  late _User? updatedBy; 
}


@RealmModel()
@MapTo("StockMovements")
class _StockMovement{
  @PrimaryKey()
  @MapTo("_id")
  late ObjectId id;
  late double quantity;
  late double? quantityAfterMouvement;
  late DateTime recordedAt;
  @Indexed()
  late String reference;
  late String? justification;
  late _Stock? stock;
  late _User? createdBy;
  late int moveType;
  late int status=0;
  late _User? validatedBy;
  late DateTime? validatedAt;

}


@RealmModel()
@MapTo("Categories")
class _Category{
  @PrimaryKey()
  @MapTo("_id")
  late ObjectId id;
  @Indexed()
  late String title;
}

@RealmModel()
@MapTo("MeasurementUnits")
class _MeasurementUnit{
  @PrimaryKey()
  @MapTo("_id")
  late ObjectId id;
  @Indexed()
  late String title; 
}

