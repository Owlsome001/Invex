import 'package:realm/realm.dart';
import 'package:sim/controllers/app_controller.dart';
import 'package:sim/models/models.dart';


class MeasurementUnitRepository {
  final Realm _realm = AppController.simRealm!;


  RealmResults<MeasurementUnit> findAll(){
    return _realm.all<MeasurementUnit>();
  }

  MeasurementUnit? findOne(ObjectId id){
    return _realm.find<MeasurementUnit>(id);
  }

  MeasurementUnit updateOne(MeasurementUnit unit, String title){
    return _realm.write((){
      unit.title = title;
      return unit;
    });
  }
}