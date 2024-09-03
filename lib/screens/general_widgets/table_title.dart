import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';

class TableTitle extends StatelessWidget {
  const TableTitle({super.key, required this.tableTitleWiget});
  final Widget tableTitleWiget;
  @override
  Widget build(BuildContext context) {
    return Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    decoration:  BoxDecoration(
                      color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
                      borderRadius: const BorderRadius.only(topLeft: Radius.circular(5), topRight: Radius.circular(5))
                    ),

                    //Table title
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 7,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: tableTitleWiget,
                          ),
                        ),
                        const Expanded(
                          flex: 3,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  child: Icon(
                                    size: 20,
                                    BootstrapIcons.funnel,
                                  ),
                                ),
                                Text("Filtrer"),
                                
                              ],
                            ),
                          ),
                        )
                    ]),
                  );
  }
}