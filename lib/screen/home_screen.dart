import 'package:expense_manager/screen/Login.dart';
import 'package:expense_manager/widgets/add_transaction.dart';
import 'package:expense_manager/widgets/hero_card.dart';
import 'package:expense_manager/widgets/transaction_card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
    var isLogout= false;
  LogOut() async {
    setState(() {
      isLogout=true;
    });
    await FirebaseAuth.instance.signOut();
      Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) =>  const Login()
                ),
             );               
    setState(() {
      isLogout= false;
    });
  }

  dialogBuilder(BuildContext context){
    return showDialog(context: context, builder: (context){
      return AlertDialog(
        content: AddTransaction(),
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.teal.shade300,
        onPressed: ((){
          dialogBuilder(context);
      }),
      child: Icon(Icons.add,
      color: Colors.white,)
      ),
       appBar: AppBar(
        backgroundColor: Colors.teal.shade300,
        title: const Text('Hi,',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(onPressed: (){
            LogOut();
          }, icon: isLogout? const CircularProgressIndicator():
           const Icon(Icons.exit_to_app, color: Colors.white,))
        ],
      ),
      body: Column(
        children: [
          const HeroCard(),            
          TransactionCard(),
        ],
      ),
    );
  }
}
