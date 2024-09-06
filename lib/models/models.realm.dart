// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class User extends _User with RealmEntity, RealmObjectBase, RealmObject {
  User(
    ObjectId id,
    String username,
    String password,
    String role,
    String firstName,
    String lastName,
    String surname,
  ) {
    RealmObjectBase.set(this, '_id', id);
    RealmObjectBase.set(this, 'username', username);
    RealmObjectBase.set(this, 'password', password);
    RealmObjectBase.set(this, 'role', role);
    RealmObjectBase.set(this, 'firstName', firstName);
    RealmObjectBase.set(this, 'lastName', lastName);
    RealmObjectBase.set(this, 'surname', surname);
  }

  User._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, '_id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, '_id', value);

  @override
  String get username =>
      RealmObjectBase.get<String>(this, 'username') as String;
  @override
  set username(String value) => RealmObjectBase.set(this, 'username', value);

  @override
  String get password =>
      RealmObjectBase.get<String>(this, 'password') as String;
  @override
  set password(String value) => RealmObjectBase.set(this, 'password', value);

  @override
  String get role => RealmObjectBase.get<String>(this, 'role') as String;
  @override
  set role(String value) => RealmObjectBase.set(this, 'role', value);

  @override
  String get firstName =>
      RealmObjectBase.get<String>(this, 'firstName') as String;
  @override
  set firstName(String value) => RealmObjectBase.set(this, 'firstName', value);

  @override
  String get lastName =>
      RealmObjectBase.get<String>(this, 'lastName') as String;
  @override
  set lastName(String value) => RealmObjectBase.set(this, 'lastName', value);

  @override
  String get surname => RealmObjectBase.get<String>(this, 'surname') as String;
  @override
  set surname(String value) => RealmObjectBase.set(this, 'surname', value);

  @override
  Stream<RealmObjectChanges<User>> get changes =>
      RealmObjectBase.getChanges<User>(this);

  @override
  Stream<RealmObjectChanges<User>> changesFor([List<String>? keyPaths]) =>
      RealmObjectBase.getChangesFor<User>(this, keyPaths);

  @override
  User freeze() => RealmObjectBase.freezeObject<User>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      '_id': id.toEJson(),
      'username': username.toEJson(),
      'password': password.toEJson(),
      'role': role.toEJson(),
      'firstName': firstName.toEJson(),
      'lastName': lastName.toEJson(),
      'surname': surname.toEJson(),
    };
  }

  static EJsonValue _toEJson(User value) => value.toEJson();
  static User _fromEJson(EJsonValue ejson) {
    if (ejson is! Map<String, dynamic>) return raiseInvalidEJson(ejson);
    return switch (ejson) {
      {
        '_id': EJsonValue id,
        'username': EJsonValue username,
        'password': EJsonValue password,
        'role': EJsonValue role,
        'firstName': EJsonValue firstName,
        'lastName': EJsonValue lastName,
        'surname': EJsonValue surname,
      } =>
        User(
          fromEJson(id),
          fromEJson(username),
          fromEJson(password),
          fromEJson(role),
          fromEJson(firstName),
          fromEJson(lastName),
          fromEJson(surname),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(User._);
    register(_toEJson, _fromEJson);
    return const SchemaObject(ObjectType.realmObject, User, 'Users', [
      SchemaProperty('id', RealmPropertyType.objectid,
          mapTo: '_id', primaryKey: true),
      SchemaProperty('username', RealmPropertyType.string),
      SchemaProperty('password', RealmPropertyType.string),
      SchemaProperty('role', RealmPropertyType.string),
      SchemaProperty('firstName', RealmPropertyType.string),
      SchemaProperty('lastName', RealmPropertyType.string),
      SchemaProperty('surname', RealmPropertyType.string),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}

class Stock extends _Stock with RealmEntity, RealmObjectBase, RealmObject {
  Stock(
    ObjectId id,
    String stockName,
    double quantity, {
    Category? category,
    MeasurementUnit? measurementUnit,
  }) {
    RealmObjectBase.set(this, '_id', id);
    RealmObjectBase.set(this, 'stockName', stockName);
    RealmObjectBase.set(this, 'category', category);
    RealmObjectBase.set(this, 'measurementUnit', measurementUnit);
    RealmObjectBase.set(this, 'quantity', quantity);
  }

  Stock._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, '_id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, '_id', value);

  @override
  String get stockName =>
      RealmObjectBase.get<String>(this, 'stockName') as String;
  @override
  set stockName(String value) => RealmObjectBase.set(this, 'stockName', value);

  @override
  Category? get category =>
      RealmObjectBase.get<Category>(this, 'category') as Category?;
  @override
  set category(covariant Category? value) =>
      RealmObjectBase.set(this, 'category', value);

  @override
  MeasurementUnit? get measurementUnit =>
      RealmObjectBase.get<MeasurementUnit>(this, 'measurementUnit')
          as MeasurementUnit?;
  @override
  set measurementUnit(covariant MeasurementUnit? value) =>
      RealmObjectBase.set(this, 'measurementUnit', value);

  @override
  double get quantity =>
      RealmObjectBase.get<double>(this, 'quantity') as double;
  @override
  set quantity(double value) => RealmObjectBase.set(this, 'quantity', value);

  @override
  Stream<RealmObjectChanges<Stock>> get changes =>
      RealmObjectBase.getChanges<Stock>(this);

  @override
  Stream<RealmObjectChanges<Stock>> changesFor([List<String>? keyPaths]) =>
      RealmObjectBase.getChangesFor<Stock>(this, keyPaths);

  @override
  Stock freeze() => RealmObjectBase.freezeObject<Stock>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      '_id': id.toEJson(),
      'stockName': stockName.toEJson(),
      'category': category.toEJson(),
      'measurementUnit': measurementUnit.toEJson(),
      'quantity': quantity.toEJson(),
    };
  }

  static EJsonValue _toEJson(Stock value) => value.toEJson();
  static Stock _fromEJson(EJsonValue ejson) {
    if (ejson is! Map<String, dynamic>) return raiseInvalidEJson(ejson);
    return switch (ejson) {
      {
        '_id': EJsonValue id,
        'stockName': EJsonValue stockName,
        'quantity': EJsonValue quantity,
      } =>
        Stock(
          fromEJson(id),
          fromEJson(stockName),
          fromEJson(quantity),
          category: fromEJson(ejson['category']),
          measurementUnit: fromEJson(ejson['measurementUnit']),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(Stock._);
    register(_toEJson, _fromEJson);
    return const SchemaObject(ObjectType.realmObject, Stock, 'Stocks', [
      SchemaProperty('id', RealmPropertyType.objectid,
          mapTo: '_id', primaryKey: true),
      SchemaProperty('stockName', RealmPropertyType.string),
      SchemaProperty('category', RealmPropertyType.object,
          optional: true, linkTarget: 'Categories'),
      SchemaProperty('measurementUnit', RealmPropertyType.object,
          optional: true, linkTarget: 'MeasurementUnits'),
      SchemaProperty('quantity', RealmPropertyType.double),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}

class StockMovement extends _StockMovement
    with RealmEntity, RealmObjectBase, RealmObject {
  StockMovement(
    ObjectId id,
    double quantity,
    double quantityAfterMouvement,
    String reference,
    String justification,
    int moveType,
    int status, {
    Stock? stock,
    User? user,
  }) {
    RealmObjectBase.set(this, '_id', id);
    RealmObjectBase.set(this, 'quantity', quantity);
    RealmObjectBase.set(this, 'quantityAfterMouvement', quantityAfterMouvement);
    RealmObjectBase.set(this, 'reference', reference);
    RealmObjectBase.set(this, 'justification', justification);
    RealmObjectBase.set(this, 'stock', stock);
    RealmObjectBase.set(this, 'user', user);
    RealmObjectBase.set(this, 'moveType', moveType);
    RealmObjectBase.set(this, 'status', status);
  }

  StockMovement._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, '_id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, '_id', value);

  @override
  double get quantity =>
      RealmObjectBase.get<double>(this, 'quantity') as double;
  @override
  set quantity(double value) => RealmObjectBase.set(this, 'quantity', value);

  @override
  double get quantityAfterMouvement =>
      RealmObjectBase.get<double>(this, 'quantityAfterMouvement') as double;
  @override
  set quantityAfterMouvement(double value) =>
      RealmObjectBase.set(this, 'quantityAfterMouvement', value);

  @override
  String get reference =>
      RealmObjectBase.get<String>(this, 'reference') as String;
  @override
  set reference(String value) => RealmObjectBase.set(this, 'reference', value);

  @override
  String get justification =>
      RealmObjectBase.get<String>(this, 'justification') as String;
  @override
  set justification(String value) =>
      RealmObjectBase.set(this, 'justification', value);

  @override
  Stock? get stock => RealmObjectBase.get<Stock>(this, 'stock') as Stock?;
  @override
  set stock(covariant Stock? value) =>
      RealmObjectBase.set(this, 'stock', value);

  @override
  User? get user => RealmObjectBase.get<User>(this, 'user') as User?;
  @override
  set user(covariant User? value) => RealmObjectBase.set(this, 'user', value);

  @override
  int get moveType => RealmObjectBase.get<int>(this, 'moveType') as int;
  @override
  set moveType(int value) => RealmObjectBase.set(this, 'moveType', value);

  @override
  int get status => RealmObjectBase.get<int>(this, 'status') as int;
  @override
  set status(int value) => RealmObjectBase.set(this, 'status', value);

  @override
  Stream<RealmObjectChanges<StockMovement>> get changes =>
      RealmObjectBase.getChanges<StockMovement>(this);

  @override
  Stream<RealmObjectChanges<StockMovement>> changesFor(
          [List<String>? keyPaths]) =>
      RealmObjectBase.getChangesFor<StockMovement>(this, keyPaths);

  @override
  StockMovement freeze() => RealmObjectBase.freezeObject<StockMovement>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      '_id': id.toEJson(),
      'quantity': quantity.toEJson(),
      'quantityAfterMouvement': quantityAfterMouvement.toEJson(),
      'reference': reference.toEJson(),
      'justification': justification.toEJson(),
      'stock': stock.toEJson(),
      'user': user.toEJson(),
      'moveType': moveType.toEJson(),
      'status': status.toEJson(),
    };
  }

  static EJsonValue _toEJson(StockMovement value) => value.toEJson();
  static StockMovement _fromEJson(EJsonValue ejson) {
    if (ejson is! Map<String, dynamic>) return raiseInvalidEJson(ejson);
    return switch (ejson) {
      {
        '_id': EJsonValue id,
        'quantity': EJsonValue quantity,
        'quantityAfterMouvement': EJsonValue quantityAfterMouvement,
        'reference': EJsonValue reference,
        'justification': EJsonValue justification,
        'moveType': EJsonValue moveType,
        'status': EJsonValue status,
      } =>
        StockMovement(
          fromEJson(id),
          fromEJson(quantity),
          fromEJson(quantityAfterMouvement),
          fromEJson(reference),
          fromEJson(justification),
          fromEJson(moveType),
          fromEJson(status),
          stock: fromEJson(ejson['stock']),
          user: fromEJson(ejson['user']),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(StockMovement._);
    register(_toEJson, _fromEJson);
    return const SchemaObject(
        ObjectType.realmObject, StockMovement, 'StockMovements', [
      SchemaProperty('id', RealmPropertyType.objectid,
          mapTo: '_id', primaryKey: true),
      SchemaProperty('quantity', RealmPropertyType.double),
      SchemaProperty('quantityAfterMouvement', RealmPropertyType.double),
      SchemaProperty('reference', RealmPropertyType.string),
      SchemaProperty('justification', RealmPropertyType.string),
      SchemaProperty('stock', RealmPropertyType.object,
          optional: true, linkTarget: 'Stocks'),
      SchemaProperty('user', RealmPropertyType.object,
          optional: true, linkTarget: 'Users'),
      SchemaProperty('moveType', RealmPropertyType.int),
      SchemaProperty('status', RealmPropertyType.int),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}

class Category extends _Category
    with RealmEntity, RealmObjectBase, RealmObject {
  Category(
    ObjectId id,
    String title,
  ) {
    RealmObjectBase.set(this, '_id', id);
    RealmObjectBase.set(this, 'title', title);
  }

  Category._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, '_id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, '_id', value);

  @override
  String get title => RealmObjectBase.get<String>(this, 'title') as String;
  @override
  set title(String value) => RealmObjectBase.set(this, 'title', value);

  @override
  Stream<RealmObjectChanges<Category>> get changes =>
      RealmObjectBase.getChanges<Category>(this);

  @override
  Stream<RealmObjectChanges<Category>> changesFor([List<String>? keyPaths]) =>
      RealmObjectBase.getChangesFor<Category>(this, keyPaths);

  @override
  Category freeze() => RealmObjectBase.freezeObject<Category>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      '_id': id.toEJson(),
      'title': title.toEJson(),
    };
  }

  static EJsonValue _toEJson(Category value) => value.toEJson();
  static Category _fromEJson(EJsonValue ejson) {
    if (ejson is! Map<String, dynamic>) return raiseInvalidEJson(ejson);
    return switch (ejson) {
      {
        '_id': EJsonValue id,
        'title': EJsonValue title,
      } =>
        Category(
          fromEJson(id),
          fromEJson(title),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(Category._);
    register(_toEJson, _fromEJson);
    return const SchemaObject(ObjectType.realmObject, Category, 'Categories', [
      SchemaProperty('id', RealmPropertyType.objectid,
          mapTo: '_id', primaryKey: true),
      SchemaProperty('title', RealmPropertyType.string),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}

class MeasurementUnit extends _MeasurementUnit
    with RealmEntity, RealmObjectBase, RealmObject {
  MeasurementUnit(
    ObjectId id,
    String title,
  ) {
    RealmObjectBase.set(this, '_id', id);
    RealmObjectBase.set(this, 'title', title);
  }

  MeasurementUnit._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, '_id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, '_id', value);

  @override
  String get title => RealmObjectBase.get<String>(this, 'title') as String;
  @override
  set title(String value) => RealmObjectBase.set(this, 'title', value);

  @override
  Stream<RealmObjectChanges<MeasurementUnit>> get changes =>
      RealmObjectBase.getChanges<MeasurementUnit>(this);

  @override
  Stream<RealmObjectChanges<MeasurementUnit>> changesFor(
          [List<String>? keyPaths]) =>
      RealmObjectBase.getChangesFor<MeasurementUnit>(this, keyPaths);

  @override
  MeasurementUnit freeze() =>
      RealmObjectBase.freezeObject<MeasurementUnit>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      '_id': id.toEJson(),
      'title': title.toEJson(),
    };
  }

  static EJsonValue _toEJson(MeasurementUnit value) => value.toEJson();
  static MeasurementUnit _fromEJson(EJsonValue ejson) {
    if (ejson is! Map<String, dynamic>) return raiseInvalidEJson(ejson);
    return switch (ejson) {
      {
        '_id': EJsonValue id,
        'title': EJsonValue title,
      } =>
        MeasurementUnit(
          fromEJson(id),
          fromEJson(title),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(MeasurementUnit._);
    register(_toEJson, _fromEJson);
    return const SchemaObject(
        ObjectType.realmObject, MeasurementUnit, 'MeasurementUnits', [
      SchemaProperty('id', RealmPropertyType.objectid,
          mapTo: '_id', primaryKey: true),
      SchemaProperty('title', RealmPropertyType.string),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}
