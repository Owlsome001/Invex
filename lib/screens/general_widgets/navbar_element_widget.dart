import 'package:flutter/material.dart';

class NavBarElementWigdet extends StatefulWidget {
  const NavBarElementWigdet({super.key, required this.navIndex, required this.title, required this.onTap, required this.icon, required this.tabController});
  final int navIndex;
  final String title;
  final Function onTap;
  final Icon icon;
  final TabController tabController;
  @override
  State<NavBarElementWigdet> createState() => _NavBarElementWigdetState();
}

class _NavBarElementWigdetState extends State<NavBarElementWigdet> {
  bool hovering=false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>widget.onTap(),
      child: MouseRegion(
        onHover: (event){
          setState(() {
            hovering= true;
          });
        },
        onExit: (event){
            setState(() {
            hovering= false;
          });
        },
        child: Container(
          decoration: BoxDecoration(
            color: widget.navIndex==widget.tabController.index?Theme.of(context).colorScheme.secondary.withOpacity(0.3):hovering?Theme.of(context).colorScheme.primary.withOpacity(0.2):null,
            borderRadius: BorderRadius.circular(10)
          ),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          margin: const EdgeInsets.only(bottom: 10),
          child: Row(
            children: [
              widget.icon,
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  widget.title,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    color: Theme.of(context).colorScheme.onBackground
                  ),
                  ),
              )
            ],),
        ),
      ),
    );
  }
}