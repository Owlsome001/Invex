import 'package:flutter/material.dart';

class MouvementTypeFormField extends StatelessWidget {
  const MouvementTypeFormField({super.key, required this.movementTypeNotifier});
  final ValueNotifier<int> movementTypeNotifier;
  @override
  Widget build(BuildContext context) {
    return  ValueListenableBuilder(valueListenable: movementTypeNotifier , builder: (context, value, widget){ 
                                  return Row(
                                    children: [
                                      Expanded(
                                        child: GestureDetector(
                                          onTap: (){
                                             movementTypeNotifier.value=0;
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.all(5),
                                            decoration: BoxDecoration(
                                              color: value==0?Theme.of(context).colorScheme.tertiary:Theme.of(context).colorScheme.surface,
                                              border: Border.all(color:Theme.of(context).colorScheme.primary),
                                            ),
                                            child:  Center(
                                              child: Text(
                                                "Entrée",
                                                style: TextStyle(
                                                  color: value==0?Theme.of(context).colorScheme.surface:null
                                                ),
                                                )),
                                          ),
                                        ),
                                      ),

                                      Expanded(
                                        child: GestureDetector(
                                          onTap: (){
                                            movementTypeNotifier.value=1;
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.all(5),
                                            decoration: BoxDecoration(
                                              color: value==1?Theme.of(context).colorScheme.primary:Theme.of(context).colorScheme.surface,
                                              border: Border.all(color:Theme.of(context).colorScheme.primary), 
                                            ),
                                            child:  Center(
                                              child: Text(
                                                "Sortie",
                                                style: TextStyle(
                                                color: value==1?Theme.of(context).colorScheme.surface:null
                                                ),
                                                )),
                                          ),
                                        ),
                                      )
                                    ],
                                  );
                                });
                              
  }
}