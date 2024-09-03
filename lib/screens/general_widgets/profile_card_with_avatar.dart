import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sim/controllers/account_controller.dart';

class AvatarCard extends StatefulWidget {
  const AvatarCard({super.key});

  @override
  State<AvatarCard> createState() => _AvatarCardState();
}

class _AvatarCardState extends State<AvatarCard> {
  @override
  late Offset _mousePosition;

   @override
  void initState() {
    super.initState();
    _mousePosition = const Offset(0.0, 0.0);
  }
  
  @override
  Widget build(BuildContext context) {
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
                debugPrint("About de logout");
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
                "EM",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.background),
                ),
            ),
            !Platform.isAndroid?const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Egide Mushoko",
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                    ),
                  Text(
                    "Magasinier",
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
}