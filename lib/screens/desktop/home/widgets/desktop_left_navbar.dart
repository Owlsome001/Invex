import 'package:flutter/material.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:sim/screens/general_widgets/nav_element.dart';
import 'package:sim/screens/general_widgets/navbar.dart';
import 'package:sim/screens/general_widgets/sim_logo_card.dart';

class DesktopLeftNavigationBar extends StatelessWidget {
  const DesktopLeftNavigationBar({super.key, required this.tabController});
  final TabController tabController;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      height: double.infinity,
      width: double.infinity,
      child: Column(
        children: [
          //Responsive space
          const Expanded(
            flex: 10,
            child: SizedBox()
          ),
          //Brand with moto
          const Expanded(
            flex: 15,
            child: SimLogoCard()
            ),
          //Responsive space
          const Expanded(
            flex: 15,
            child:SizedBox()
          ),
          //Menue 
          Expanded(
            flex: 25,
            child:  Column(
              children: [
                NavBar(
                  tabController: tabController, 
                  navBarOptions: const [
                    NavElement(title: "Tableau de bord", Icon(Icons.dashboard_customize)),
                    NavElement(title: "Stocks",Icon(BootstrapIcons.box_fill)),
                    NavElement(title: "Rapports & Analyses", Icon(BootstrapIcons.bar_chart_line_fill))
                  ],)
                ],
            )
          ),
          //Responsive space
          const Expanded(
            flex: 5,
            child: SizedBox()
          ),
          //HelpCenter
          const Expanded(
            flex: 15,
            child: SizedBox()
          ),
          //Responsive space
          const Expanded(
            flex: 15,
            child: SizedBox()
          )
        ],
      ),
    );
  }
}