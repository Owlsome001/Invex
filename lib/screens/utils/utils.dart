import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sim/controllers/app_controller.dart';
import 'package:sim/screens/general_widgets/sim_dialog.dart';
import 'package:toastification/toastification.dart';

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
  AppController.formError.value = {"hasError":false, "errorText":""};
  return  await showDialog(
                  barrierDismissible: false,
                  context: context, builder: (context) {
                     ScrollController scrollController = ScrollController();
                    return Center(
                      child: FittedBox(
                        fit: BoxFit.contain,
                        child: Container(
                        width: MediaQuery.of(context).size.width/2.5,
                        height: MediaQuery.of(context).size.height/1.8,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.surface,
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
                                    color: Theme.of(context).colorScheme.onSurface,
                                    decoration: TextDecoration.none
                                  ),
                                ),
                              ),
                                
                            ),
                            Expanded(
                              child: SingleChildScrollView(
                                controller: scrollController,
                                child: Center(child: form))),
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
                                              AppController.formError.value = {"hasError":false, "errorText":""};
                                              Navigator.of(context, rootNavigator: true).pop();
                                            },
                                            style: ButtonStyle(backgroundColor: WidgetStatePropertyAll<Color>(Theme.of(context).colorScheme.primary)), 
                                            child: Text(
                                              "Annuler",
                                              style: TextStyle(
                                                color: Theme.of(context).colorScheme.surface
                                              ),
                                              ),
                                            ),
                                        ),
                                        
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        
                                        Expanded(
                                          child: TextButton(
                                            onPressed:(){
                                              scrollController.animateTo(
                                                 scrollController.position.minScrollExtent,
                                                  duration: const Duration(milliseconds: 500),
                                                  curve: Curves.ease
                                              );
                                              onSave()
                                              ;}, 
                                            style: ButtonStyle(backgroundColor: WidgetStatePropertyAll<Color>(Theme.of(context).colorScheme.secondary)), 
                                            child: Text(
                                              "Enregister",
                                              style: TextStyle(
                                                color: Theme.of(context).colorScheme.surface
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
                      );
                  }
                  );
}

String dateFormater({required DateTime date, bool isUTC=true}){
  DateTime toLocalDate= isUTC?date.toLocal():date;

  return "${toLocalDate.day<10?"0":""}${toLocalDate.day}.${toLocalDate.month<10?"0":""}${toLocalDate.month}.${toLocalDate.year}";
}


Future<void> showSimDialog(BuildContext context,SimDialog dialog) async{
  return await showDialog(context: context, builder: (context){
    return dialog;
  });
  
}

void showNotification({required String title, required String message, required bool isErrorMessage}){
   toastification.show(
            title: Text(title),
            description: Text(message),
            style: ToastificationStyle.flatColored,
            type: isErrorMessage ?ToastificationType.error:ToastificationType.success,
            showIcon: true,
            alignment: Alignment.bottomRight,
            autoCloseDuration: const Duration(seconds: 4,
            ),
            callbacks: ToastificationCallbacks(
              onTap: (toast) async{
                // await StockSheetService.getSimStockSheetDirectory(type: StockSheetType.pdf).then((value)=>launchUrl(Uri.file(value)));
              }
            )
          );
}