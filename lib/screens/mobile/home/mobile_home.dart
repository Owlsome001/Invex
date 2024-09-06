import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sim/screens/general_widgets/nav_element.dart';
import 'package:sim/screens/general_widgets/navbar.dart';
import 'package:sim/screens/mobile/dashbord/mobile_dashbord.dart';
import 'package:sim/screens/mobile/home/widgets/mobile_custom_appbar.dart';
import 'package:sim/screens/mobile/report_and_analysis/mobile_report_and_analysis.dart';
import 'package:sim/screens/mobile/stocks/mobile_stocks.dart';

class MobileHomeScreen extends StatefulWidget  {
  const MobileHomeScreen({super.key});

  @override
  State<MobileHomeScreen> createState() => _MobileHomeScreenState();
}

class _MobileHomeScreenState extends State<MobileHomeScreen> with TickerProviderStateMixin {
   late final TabController _tabController;
  int tabIndex = 0;

  @override
  void initState() {
    _tabController = TabController(length:  3, vsync: this, initialIndex: 0);
    if (kIsWeb) {
      BrowserContextMenu.disableContextMenu();
    }
    _tabController.addListener(() {
      setState(() {
        tabIndex = _tabController.index;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    // Disable contextuel menu on web devices
    _tabController.dispose();

    if (kIsWeb) {
      BrowserContextMenu.disableContextMenu();
    }
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  CustomMobileAppBard(tabIndex: _tabController.index,),
      body:TabBarView(
        controller: _tabController,
        children: const [
          MobileDashbord(),
          MobileStocks(),
          MobileReportAnalysis()
        ]
      ),
      bottomNavigationBar: NavBar(
        tabController: _tabController,
        navBarOptions:  [
          NavElement(title: "Acceuil", Icon(
            Icons.dashboard_customize,
            color: Theme.of(context).colorScheme.onBackground,
            
            )),
          NavElement(title: "Stocks", Icon(
            BootstrapIcons.box_fill,
            color: Theme.of(context).colorScheme.onBackground,
          )),
          NavElement(title: "Rapports", Icon(
            BootstrapIcons.bar_chart_line_fill,
            color: Theme.of(context).colorScheme.onBackground,
          )),
          NavElement(title: "Paramètres", Icon(
            Icons.settings,
            color: Theme.of(context).colorScheme.onBackground,
            ))
        ],
      ),
    );
  }
}