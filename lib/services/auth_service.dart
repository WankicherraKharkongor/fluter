import 'package:expense_manager/screen/dashboard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService{
  createUser(data, context) async {
    try {
  await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: data['email'],
    password: data['password'],
  );
  Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const Dashbboard()
                ),
             );
} catch (e) {
  showDialog(context: context, builder: (context){
    return AlertDialog(
      title: const Text("Sign up Failed"),
      content: Text(e.toString()),
    );
  });
  }
}
  login(data, context) async {
  try {
  await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: data['email'],
    password: data['password'],
  );
  Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const Dashbboard()
                ),
             );

} catch (e) {
  showDialog(context: context, builder: (context){
    return AlertDialog(
      title: const Text("Login Failed"),
      content: Text(e.toString()),
    );
  });
  }
}

}