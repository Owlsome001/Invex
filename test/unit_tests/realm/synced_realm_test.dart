
import 'package:flutter_test/flutter_test.dart';
import 'package:realm/realm.dart';
import 'package:sim/controllers/app_controller.dart';
import 'package:sim/services/user_service.dart';

void main() {
  late Realm realm;

  setUp(() async{
    //App Initialization
    await AppController.initAppController();
    //Log in to Atlas App Service
    await UserService.login("egide", "1234");
    //Open the database with the user that logged from the setUp()
    AppController.openDatabase();
    //Assign the AppControllerReal to the test realm
    realm = AppController.simRealm!;

  });  

  tearDown(()async{
     
     //TODO: DELETE RECORD FORM TEST

     //Force synchronization
    //  await realm.syncSession.waitForDownload();
    //  await realm.syncSession.waitForUpload();

    //  Get realm path so that it may be deleted after being closed
    //  final path = realm.config.path;
    //  realm.close();
    //  Realm.deleteRealm(path);
     




  });

  group('Sim (Synced)Realm Unit Test:', () {

    test("Declare subscriptions", () async {
      AppController.declareSubscriptions();
      const subscriptionName = "AllStocks";
      expect(realm.subscriptions.findByName(subscriptionName), isA<Subscription>());

    });
  });
}