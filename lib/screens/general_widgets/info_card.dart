import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({super.key, required this.content, required this.title});
  final Widget content;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.background,
                border: Border.all(
                  color: Theme.of(context).colorScheme.primary.withOpacity(0.2)
                ),
                borderRadius: BorderRadius.circular(10)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
                      borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10))
                    ),
                    child: Center(child: Text(title)),
                  ),
                  Container(
                    margin: EdgeInsets.all(20),
                    child: content)
                ],
              ),
            );
  }
}