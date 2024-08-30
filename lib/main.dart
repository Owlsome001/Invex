import 'package:flutter/material.dart';
import 'package:sim/controllers/app_controller.dart';
import 'package:sim/screens/general_widgets/spash_screen.dart';
import 'package:sim/screens/utils/utils.dart';
import 'package:sim/theme.dart';

void main() async{
  await AppController.initAppController();
  runApp(const Sim());
}

class Sim extends StatelessWidget {
  const Sim({super.key});
  @override
  Widget build(BuildContext context) {
    
    final brightness = View.of(context).platformDispatcher.platformBrightness;
    TextTheme textTheme = createTextTheme(context, "Roboto", "Inter");
    MaterialTheme theme = MaterialTheme(textTheme);
    return MaterialApp(
      title: 'SIM',
      debugShowCheckedModeBanner: false,
      // theme: brightness == Brightness.light ? theme.light() : theme.dark(),
      theme:  theme.light(),
      home: const SplashScreen(),
    );
  }
}
