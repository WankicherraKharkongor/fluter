import 'package:flutter/material.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key, required this.selectedIndex, required this.onDestinationSelected});
  final int selectedIndex;
  final ValueChanged<int>onDestinationSelected;

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
        onDestinationSelected: onDestinationSelected,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        indicatorColor: const Color.fromARGB(255, 8, 82, 239),
        height: 60,
        selectedIndex: selectedIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home, color: Colors.white,),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.explore, color: Colors.white,),
            icon: Badge(child: Icon(Icons.explore)),
            label: 'Transaction',
          ),         
        ],
      );
  }
}