
import 'package:realm/realm.dart';
import 'package:sim/controllers/app_controller.dart';
import 'package:sim/models/models.dart';

class CategoryRepository {
  final Realm _realm = AppController.simRealm!;

  RealmResults<Category> findAll(){
    return _realm.all<Category>();
  }

   Category? findOne(ObjectId id){
    return _realm.find<Category>(id);
  }

   Category updateOne(Category category, String title){
    return _realm.write((){
      category.title = title;
      return category;
    });
  }

}