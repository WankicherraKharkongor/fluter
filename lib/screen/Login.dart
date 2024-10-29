import 'package:expense_manager/screen/Sign_up.dart';
import 'package:expense_manager/services/auth_service.dart';
import 'package:expense_manager/utils/AppValidate.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget{
   const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState>_formKey= GlobalKey<FormState>();
  final _emailController=TextEditingController();
  final _passwordController=TextEditingController();

  
    var authService= AuthService();
    var isLoader = false;

    Future<void> _submitForm() async {
      if(_formKey.currentState!.validate()){
        setState(() {
          isLoader = true;
        });
         var data = {
          "email": _emailController.text,
          "password": _passwordController.text
         } ;

await authService.login(data, context);

      setState(() {
        isLoader=false;
      });
      }
    }
    var appValidator =AppValidator();

   @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Form(
        key: _formKey,
        child: Column(
         children: [
          const SizedBox(
            height: 80,
          ),
          const SizedBox(
            width: 250,
            child: Text(
              'Login Account'
            ),
          ),
            const SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: _emailController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: const InputDecoration(
              labelText: 'Email'
            ),
            validator: appValidator.validateEmail
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: _passwordController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: const InputDecoration(
              labelText: 'Password'
            ),
            validator: appValidator.validatePassword,
          ),
          const SizedBox(
            height: 20,
          ),
           SizedBox(
            height: 50,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: (){
                isLoader? print("loading") : _submitForm();

              },
              child: isLoader 
              ?const Center(child: CircularProgressIndicator())
              :const Text("Login"))),
            const SizedBox(
              height: 20,
            ),
            TextButton(onPressed: (){
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const Sign_up()
                ),
             );
            }, child: const Text('Create a new account'))
            
         ], 
        ))
    );
  }
}