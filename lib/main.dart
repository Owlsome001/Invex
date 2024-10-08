import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sim/controllers/app_controller.dart';
import 'package:sim/screens/general_widgets/spash_screen.dart';
import 'package:sim/screens/utils/utils.dart';
import 'package:sim/theme.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:toastification/toastification.dart';
import 'package:window_manager/window_manager.dart';

void main() async{
  await Supabase.initialize(
    url: 'https://dfszkfogchkqlhwhyofm.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImRmc3prZm9nY2hrcWxod2h5b2ZtIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Mjc1MTE2MDgsImV4cCI6MjA0MzA4NzYwOH0.H83LoDcGRXo9PzM0lRivfjwdOQSINEWQyeqtQqt_-I0',
  );
  WidgetsFlutterBinding.ensureInitialized();
  if(Platform.isWindows){
      await windowManager.ensureInitialized();
  }
  await AppController.initAppController();

  if(Platform.isWindows) {
    WindowManager.instance.setMinimumSize(const Size(1200, 800));
    
    await WindowManager.instance.center();
    await WindowManager.instance.isClosable();
  }

  runApp(
    const Sim()
    );
}

class Sim extends StatelessWidget {
  const Sim({super.key});
 
  
  @override
  Widget build(BuildContext context) {
    
    // final brightness = View.of(context).platformDispatcher.platformBrightness;
    TextTheme textTheme = createTextTheme(context, "Roboto", "Inter");
    MaterialTheme theme = MaterialTheme(textTheme);
     
    
    return ToastificationWrapper(
      child: MaterialApp(
        title: 'SIM',
        debugShowCheckedModeBanner: false,
        // theme: brightness == Brightness.light ? theme.light() : theme.dark(),
        theme:  theme.light(),
        home: const SplashScreen(),
      ),
    );
  }
}
