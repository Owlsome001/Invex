
import 'package:realm/realm.dart';

class AppController {
  static const String _appId = "sim-pzbbewi";
  static late AppConfiguration _appConfiguration;
  static late App sim;

  static void initAppControler(){
    _appConfiguration = AppConfiguration(_appId);
    sim = App(_appConfiguration);
  }

  
}