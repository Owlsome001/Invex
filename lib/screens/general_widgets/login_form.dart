import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sim/controllers/login_controller.dart';
import 'package:sim/screens/general_widgets/custom_form_field.dart';
import 'package:sim/screens/general_widgets/form_btn.dart';

class SimLoginForm extends StatefulWidget {
  const SimLoginForm({super.key});
  @override
  State<SimLoginForm> createState() => _SimLoginFormState();
}

class _SimLoginFormState extends State<SimLoginForm> {
  final LoginController controller = LoginController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: Platform.isAndroid? 5:25,
          child: const SizedBox()),
        Form(
          child: Column(
            children:[
              CustomTextFormField(
                controller: controller.idController,
                fieldName: "Matricule",
                fieldHint: "Entrer votre matricule",),
              const SizedBox(height: 10,),
              //Password Field
              CustomTextFormField(
                controller : controller.passwordController,
                fieldName: "Mot de passe",
                fieldHint: "Entrer votre mot de passe",
                obscureText: !controller.passwordVisible,
                suffixIcon: !controller.passwordVisible?IconButton(
                  onPressed:(){
                    setState(() {
                      setState(() {
                        controller.passwordVisible=true;
                      });
                    });
                  }, icon: 
                  const Icon(Icons.visibility)):
                  IconButton(
                  onPressed:(){
                    setState(() {
                      setState(() {
                        controller.passwordVisible=false;
                      });
                    });
                  }, icon: 
                  const Icon(Icons.visibility_off))

                  ),

                  const SizedBox(height: 20,),

                  FormBouton(
                    boutonTitle: "Se connecter", 
                    onPress: () async{
                      if(controller.validateForm()){
                         LoginController.loginFormError.value = {
                                "hasError":false, "errorText":""
                              };
                        await controller.submitLoginForm();
                      }
                    }
                  ),

                  const SizedBox(height: 20,),
                  
                  ValueListenableBuilder(
                    valueListenable: LoginController.loginFormError, builder: (context,value, child){
                      if(value["hasError"]){
                        return Center(
                          child: Text(
                            value["errorText"],
                            style: const TextStyle(
                              color: Colors.red
                            ),
                            ),
                        
                        );
                      }
                      return const SizedBox();
                    }),

                  const Center(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Mot de passe oublié ? Contactez votre supérieur."),
                    ),
                  ),

                 
              ]
          ),),

          const Expanded(
          flex: 25,
          child: SizedBox()),
      ],
    );
  }
}