import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sim/controllers/account_controller.dart';
import 'package:sim/controllers/app_controller.dart';
import 'package:sim/controllers/home_controller.dart';
import 'package:sim/controllers/login_controller.dart';
import 'package:sim/screens/general_widgets/init_app_screen.dart';

class AvatarCard extends StatefulWidget {
  const AvatarCard({super.key});

  @override
  State<AvatarCard> createState() => _AvatarCardState();
}

class _AvatarCardState extends State<AvatarCard> {
  
  late Offset _mousePosition;
  final AccountController accountController = AccountController();

   @override
  void initState() {
    super.initState();
    _mousePosition = const Offset(0.0, 0.0);
  }
  
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Object>(
      stream: AccountController.user!.changes,
      builder: (context, snapshot) {
        if(snapshot.hasData){
            // WidgetsBinding.instance.addPostFrameCallback(
            //   (_) {
            //     if(AccountController.user!.isActivated==false){
            //         Navigator.pushAndRemoveUntil(context,
            //     MaterialPageRoute(
            //       builder: (context) => LoginController.platformLoginScreen()
            //     ),(route) => false
            //     );
            //     }
              
            //   },
            // );
        }
        return GestureDetector(
          onTapDown: (event) async {
            setState(() {
              _mousePosition = event.globalPosition;
            });
            await showMenu(
              context: context, 
              position: RelativeRect.fromLTRB(_mousePosition.dx,
                                            _mousePosition.dy,
                                            MediaQuery.of(context).size.width - _mousePosition.dx,
                                            MediaQuery.of(context).size.height - _mousePosition.dy// Bigger rect, the entire screen
                                  ), 
              items: [
                PopupMenuItem(
                  onTap: () async {
                    await AccountController.logOut(context);
                  },
                  child: const Row(
                    children: [
                      Icon(Icons.logout_rounded),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text("Se deconnecter"),
                      ),
                    ],
                  ))
              ]
              );
          },
          
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                  radius: !Platform.isAndroid? 19: null,
                  child:Text(
                    accountController.avatarInitials,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.background),
                    ),
                ),
                !Platform.isAndroid? Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        accountController.userDisplayName,
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                        ),
                      Text(
                        accountController.role,
                          style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w100,
                        ),
                        )
                    ],
                  ),
                ):const SizedBox()
              ],
            ),
          ),
        );
      }
    );
  }
}