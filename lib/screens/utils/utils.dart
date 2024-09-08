import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextTheme createTextTheme(
    BuildContext context, String bodyFontString, String displayFontString) {
  TextTheme baseTextTheme = Theme.of(context).textTheme;
  TextTheme bodyTextTheme = GoogleFonts.getTextTheme(bodyFontString, baseTextTheme);
  TextTheme displayTextTheme =
      GoogleFonts.getTextTheme(displayFontString, baseTextTheme);
  TextTheme textTheme = displayTextTheme.copyWith(
    bodyLarge: bodyTextTheme.bodyLarge,
    bodyMedium: bodyTextTheme.bodyMedium,
    bodySmall: bodyTextTheme.bodySmall,
    labelLarge: bodyTextTheme.labelLarge,
    labelMedium: bodyTextTheme.labelMedium,
    labelSmall: bodyTextTheme.labelSmall,
  );
  return textTheme;
}

Future<dynamic> showSimFormModal({required BuildContext context, required Widget form, required String title, required void Function() onSave}) async {
  return  await showDialog(
                  barrierDismissible: false,
                  context: context, builder: (context)=>
                     Center(
                      child: FittedBox(
                        fit: BoxFit.contain,
                        child: Container(
                        width: MediaQuery.of(context).size.width/2.5,
                        height: MediaQuery.of(context).size.height/1.8,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.background,
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: double.infinity,
                              decoration : BoxDecoration(
                                color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
                                borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10))
                                 ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 5),
                                child: Text(
                                  textAlign: TextAlign.center,
                                  title,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                    color: Theme.of(context).colorScheme.onBackground,
                                    decoration: TextDecoration.none
                                  ),
                                ),
                              ),
                                
                            ),
                            Expanded(
                              child: SingleChildScrollView(child: Center(child: form))),
                            Container(
                              decoration : BoxDecoration(
                                color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
                                borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10))
                                 ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                        const Expanded(
                                          flex: 2,
                                          child: SizedBox()),
                                        Expanded(
                                          child: TextButton(
                                            onPressed: (){
                                              Navigator.of(context, rootNavigator: true).pop();
                                            },
                                            style: ButtonStyle(backgroundColor: MaterialStatePropertyAll<Color>(Theme.of(context).colorScheme.primary)), 
                                            child: Text(
                                              "Annuler",
                                              style: TextStyle(
                                                color: Theme.of(context).colorScheme.background
                                              ),
                                              ),
                                            ),
                                        ),
                                        
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        
                                        Expanded(
                                          child: TextButton(
                                            onPressed:()=>onSave(), 
                                            style: ButtonStyle(backgroundColor: MaterialStatePropertyAll<Color>(Theme.of(context).colorScheme.secondary)), 
                                            child: Text(
                                              "Enregister",
                                              style: TextStyle(
                                                color: Theme.of(context).colorScheme.background
                                              ),
                                              )),
                                        )
                                  ],),
                                ),
                            )
                        
                          ],
                        ),
                          ),
                      )
                      )
                  );
}
