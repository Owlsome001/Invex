import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sim/controllers/home_controller.dart';
import 'package:sim/screens/general_widgets/nav_element.dart';
import 'package:sim/screens/general_widgets/navbar_element_widget.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key, required this.tabController, required this.navBarOptions});
  final TabController tabController;
  final List<NavElement> navBarOptions;
  @override
  Widget build(BuildContext context) {
    return !Platform.isAndroid?Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(navBarOptions.length, (index){
        return NavBarElementWigdet(
          tabController: tabController,
          navIndex: index,
          title: navBarOptions[index].title,
          onTap: (){
            tabController.index=index;
            HomeController.desktopAppBarTitle.value=navBarOptions[index].title;
            },
          icon: navBarOptions[index].icon ,
          );
      }),
    ): BottomNavigationBar(
      currentIndex: tabController.index,
      backgroundColor: Theme.of(context).colorScheme.background,
      onTap: (tabIndex){
        
        if (tabIndex<=tabController.length-1) {
          tabController.index=tabIndex;
        }
                
        },
      
      selectedItemColor: Theme.of(context).colorScheme.secondary,
      
      unselectedItemColor:
          Theme.of(context).colorScheme.tertiary.withOpacity(0.7),
      showUnselectedLabels: true,
      items: navBarOptions.map((navItem) => BottomNavigationBarItem(
        backgroundColor: Theme.of(context).colorScheme.background,
        icon: navItem.icon,
        activeIcon: Icon(navItem.icon.icon,
        color: Theme.of(context).colorScheme.secondary,
        ), 
        label: navItem.title)).toList()
        );
  }
}