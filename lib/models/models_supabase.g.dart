// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models_supabase.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: (json['id'] as num?)?.toInt(),
      username: json['username'] as String,
      password: json['password'] as String,
      role: $enumDecode(_$UserRoleEnumMap, json['role']),
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      surname: json['surname'] as String,
      isActivated: json['isActivated'] as bool? ?? true,
      accountExpirationDate:
          DateTime.parse(json['accountExpirationDate'] as String),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'password': instance.password,
      'role': _$UserRoleEnumMap[instance.role]!,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'surname': instance.surname,
      'isActivated': instance.isActivated,
      'accountExpirationDate': instance.accountExpirationDate.toIso8601String(),
    };

const _$UserRoleEnumMap = {
  UserRole.magasinier: 'magasinier',
  UserRole.chefDepot: 'chefDepot',
};

Stock _$StockFromJson(Map<String, dynamic> json) => Stock(
      id: (json['id'] as num?)?.toInt(),
      stockName: json['stockName'] as String,
      category: Category.fromJson(json['category'] as Map<String, dynamic>),
      measurementUnit: MeasurementUnit.fromJson(
          json['measurementUnit'] as Map<String, dynamic>),
      createdAt: DateTime.parse(json['createdAt'] as String),
      createdBy: User.fromJson(json['createdBy'] as Map<String, dynamic>),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      updatedBy: User.fromJson(json['updatedBy'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$StockToJson(Stock instance) => <String, dynamic>{
      'id': instance.id,
      'stockName': instance.stockName,
      'category': instance.category,
      'measurementUnit': instance.measurementUnit,
      'createdAt': instance.createdAt.toIso8601String(),
      'createdBy': instance.createdBy,
      'updatedAt': instance.updatedAt.toIso8601String(),
      'updatedBy': instance.updatedBy,
    };

StockMovement _$StockMovementFromJson(Map<String, dynamic> json) =>
    StockMovement(
      id: (json['id'] as num?)?.toInt(),
      quantity: (json['quantity'] as num).toDouble(),
      quantityAfterMouvement:
          (json['quantityAfterMouvement'] as num?)?.toDouble(),
      recordedAt: DateTime.parse(json['recordedAt'] as String),
      reference: json['reference'] as String,
      justification: json['justification'] as String?,
      stock: Stock.fromJson(json['stock'] as Map<String, dynamic>),
      createdBy: User.fromJson(json['createdBy'] as Map<String, dynamic>),
      moveType: (json['moveType'] as num).toInt(),
      validatedBy: User.fromJson(json['validatedBy'] as Map<String, dynamic>),
      validatedAt: DateTime.parse(json['validatedAt'] as String),
    );

Map<String, dynamic> _$StockMovementToJson(StockMovement instance) =>
    <String, dynamic>{
      'id': instance.id,
      'quantity': instance.quantity,
      'quantityAfterMouvement': instance.quantityAfterMouvement,
      'recordedAt': instance.recordedAt.toIso8601String(),
      'reference': instance.reference,
      'justification': instance.justification,
      'stock': instance.stock,
      'createdBy': instance.createdBy,
      'moveType': instance.moveType,
      'validatedBy': instance.validatedBy,
      'validatedAt': instance.validatedAt.toIso8601String(),
    };

Category _$CategoryFromJson(Map<String, dynamic> json) => Category(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String,
    );

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
    };

MeasurementUnit _$MeasurementUnitFromJson(Map<String, dynamic> json) =>
    MeasurementUnit(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String,
    );

Map<String, dynamic> _$MeasurementUnitToJson(MeasurementUnit instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
    };
