import 'package:realm/realm.dart';
import 'package:sim/controllers/app_controller.dart';
import 'package:sim/models/models.dart' as models;

class UserRepository {
  final Realm _realm = AppController.simRealm!;
  
  models.User get user {
    return _realm.all<models.User>().first;

  }


}