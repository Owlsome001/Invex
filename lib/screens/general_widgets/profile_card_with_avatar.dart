import 'dart:io';

import 'package:flutter/material.dart';

class AvatarCard extends StatelessWidget {
  const AvatarCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}