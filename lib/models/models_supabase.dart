import 'package:json_annotation/json_annotation.dart';
part 'models_supabase.g.dart';
part 'models.converters.dart';
enum MoveType{
  input, output
}

enum MoveStatus{
  pending, validated, rejected
}

enum UserRole {
  magasinier, chefDepot
}

@JsonSerializable()
class User{
  final int? id;
  final String username;
  final String password;
  final UserRole role;
  final String firstName;
  final String lastName; 
  final String surname;
  @JsonKey(defaultValue: true)
  final bool isActivated;
  final DateTime accountExpirationDate;

  User({required this.id, required this.username, required this.password, required this.role, required this.firstName, required this.lastName, required this.surname, required this.isActivated, required this.accountExpirationDate});
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);

}

@JsonSerializable()
class Stock{
  final int? id;
  final String stockName;
  @JsonKey()
  final Category category;
  final double alerteQuantityLevel=1.0;
  @JsonKey()
  final MeasurementUnit measurementUnit;
  final double quantity = 0.0;
  final DateTime createdAt;
  @JsonKey()
  final User createdBy;
  final DateTime updatedAt;
  final User updatedBy;

  Stock({required this.id, required this.stockName, required this.category, required this.measurementUnit, required this.createdAt, required this.createdBy, required this.updatedAt, required this.updatedBy}); 
  factory Stock.fromJson(Map<String, dynamic> json) => _$StockFromJson(json);
  Map<String, dynamic> toJson() => _$StockToJson(this);
}

@JsonSerializable()
class StockMovement{
  final int? id;
  final double quantity;
  final double? quantityAfterMouvement;
  final DateTime recordedAt;
  final String reference;
  final String? justification;
  @JsonKey()
  final Stock stock;
  @JsonKey()
  final User createdBy;
  final int moveType;
  final int status=0;
  @JsonKey()
  final User validatedBy;
  final DateTime validatedAt;

  factory StockMovement.fromJson(Map<String, dynamic> json) => _$StockMovementFromJson(json);
  Map<String, dynamic> toJson() => _$StockMovementToJson(this);

  StockMovement({required this.id, required this.quantity, required this.quantityAfterMouvement, required this.recordedAt, required this.reference, required this.justification, required this.stock, required this.createdBy, required this.moveType, required this.validatedBy, required this.validatedAt});

}

@JsonSerializable()
class Category{
  final int? id;
  final String title;
  
  Category({required this.id, required this.title});

  factory Category.fromJson(Map<String, dynamic> json) => _$CategoryFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}

@JsonSerializable()
class MeasurementUnit{
  final int? id;
  final String title;

  MeasurementUnit({required this.id, required this.title});
  factory MeasurementUnit.fromJson(Map<String, dynamic> json) => _$MeasurementUnitFromJson(json);
  Map<String, dynamic> toJson() => _$MeasurementUnitToJson(this); 
}

