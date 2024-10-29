import 'package:expense_manager/screen/home_screen.dart';
import 'package:expense_manager/screen/transaction_screen.dart';
import 'package:expense_manager/widgets/navbar.dart';
import 'package:flutter/material.dart';

class Dashbboard extends StatefulWidget {
  const Dashbboard({super.key});

  @override
  State<Dashbboard> createState() => _DashbboardState();
}

class _DashbboardState extends State<Dashbboard> {
  var isLogout= false;
  int currentIndex=0;
  var pageViewList=[
    const HomeScreen(),
    const TransactionScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Navbar(selectedIndex: currentIndex, onDestinationSelected: (int value){
        setState(() {
         currentIndex=value; 
        });
      }),
     
      body: pageViewList[currentIndex],
    );
  }
}