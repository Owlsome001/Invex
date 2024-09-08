
import 'package:flutter_test/flutter_test.dart';
import 'package:realm/realm.dart';
import 'package:sim/controllers/app_controller.dart';
import 'package:sim/controllers/login_controller.dart';
import 'package:sim/models/models.dart';
import 'package:sim/services/user_service.dart';

void main() {
  setUp(() async{
    // Assuming the a user was created using MongoDB Compass
    // We initialized the app and log the user in
    AppController.initAppController();
  });

  tearDown(() async{
    if(AppController.sim.currentUser!=null){
       await AppController.sim.deleteUser(AppController.sim.currentUser!);
       await AppController.sim.currentUser?.logOut();
    }
  });
  
  group("SIM Atlas App Service Unit test : ", () { 
    
    test("Check the authentification provider", () async {
      await UserService.login("egide", "1234");
      final user = AppController.sim.currentUser!;
      await AppController.initApp(afterlogin: true);
      Realm realm = AppController.simRealm!;
      if(realm.all<Category>().isEmpty){
        realm.write((){
          realm.addAll([Category(ObjectId(), "Nourriture"), Category(ObjectId(), "Equipement"), Category(ObjectId(), "Véhicule")]);
        });
      }

      if(realm.all<MeasurementUnit>().isEmpty){
        realm.write((){
          realm.addAll([MeasurementUnit(ObjectId(), "Unité"), MeasurementUnit(ObjectId(), "Carton"), MeasurementUnit(ObjectId(), "Boîte"), MeasurementUnit(ObjectId(), "Kilogramme")]);
        });
      }

       await AppController.forceSynchronization();
      expect(user.identities.first.provider, AuthProviderType.function);
    });

    test("Check login with wrong creds ", () async {
      await UserService.login("lakdknkndvndnvdkvjnfkvfj", "1039nckjdsnknsdkvjnrvbhubdhbvbssdksdjwejd");
      expect(AppController.formError.value["errorText"], "Nom d'utilisateur ou mot de passe incorrect");
      
    });
  });
}