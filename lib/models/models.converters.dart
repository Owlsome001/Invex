part of 'models_supabase.dart';

User _$NestedUserFromJson(Map<String, dynamic> json) => User(
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

int? _$NestedUserToJson(User instance) => instance.id;

User _$NestedStockFromJson(Map<String, dynamic> json) => User(
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

int? _$NestedStockToJson(User instance) => instance.id;

User _$NestedMeasurementUnitFromJson(Map<String, dynamic> json) => User(
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

int? _$NestedCategoryToJson(User instance) => instance.id;

User _$NestedCategoryFromJson(Map<String, dynamic> json) => User(
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

int? _$NestedMeasurementUnitToJson(User instance) => instance.id;