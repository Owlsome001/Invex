import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sim/controllers/home_controller.dart';
import 'package:sim/controllers/stocks_controller.dart';
import 'package:sim/screens/desktop/dashbord/desktop_dashbord.dart';
import 'package:sim/screens/general_widgets/appbar_widget.dart';
import 'package:sim/screens/desktop/home/widgets/desktop_left_navbar.dart';
import 'package:sim/screens/desktop/stocks/desktop_stocks.dart';
import 'package:sim/screens/general_widgets/nav_element.dart';

class DesktopHomeScreen extends StatefulWidget {
  const DesktopHomeScreen({super.key, this.tabIndex=10});
  final int tabIndex;
  @override
  State<DesktopHomeScreen> createState() => _DesktopHomeScreenState();
}

class _DesktopHomeScreenState extends State<DesktopHomeScreen> with TickerProviderStateMixin {

  late final TabController _tabController;
  late int tabIndex;
  final StocksController _stocksController = StocksController();
  @override
  void initState() {
    tabIndex= widget.tabIndex;
    _tabController = TabController(length:  2, vsync: this, initialIndex: 0);
    _tabController.addListener(() { 
      switch (_tabController.index) {
        case 0:
          HomeController.desktopAppBarTitle.value="Tableau de bord";
          break;
        
        case 1:
          HomeController.desktopAppBarTitle.value="Stocks";
          break;

        case 2:
          // HomeController.desktopAppBarTitle.value="Immobiliers";
          break;
        default:
      }
    });
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
    return  Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Row(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              height: double.infinity,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
              ),
              child: DesktopLeftNavigationBar(tabController: _tabController, navBarOptions: const [
                NavElement(title: "Tableau de bord",Icon(Icons.dashboard_customize)),
                NavElement(title: "Stocks", Icon(BootstrapIcons.box_fill)),
                // NavElement(title: "Immobilier",Icon(BootstrapIcons.tools))
              ],),
            )),
          Expanded(
            flex: 8,
            child: Column(
              children: [
                const CustomAppBar(),
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      DesktopDashbord(stocksController: _stocksController,),
                      DesktopStocks(stocksController: _stocksController,),
                      // FixedAssets()
                    ],),
                ),
              ],
            ),
          ) 
        ],
       ),
    );
  }
}