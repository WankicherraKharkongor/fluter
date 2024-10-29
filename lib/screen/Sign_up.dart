import 'package:expense_manager/services/auth_service.dart';
import 'package:expense_manager/utils/AppValidate.dart';
import 'package:flutter/material.dart';
import 'Login.dart';

class Sign_up extends StatefulWidget {
   const Sign_up({super.key});

  @override
  State<Sign_up> createState() => _Sign_upState();
}
 
class _Sign_upState extends State<Sign_up> {
  final GlobalKey<FormState>_formKey= GlobalKey<FormState>();

  final _userNameController=TextEditingController();

  final _phoneController=TextEditingController();

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
          "username": _userNameController.text,
          "phone": _phoneController.text,
          "email": _emailController.text,
          "password": _passwordController.text
         } ;

        await authService.createUser(data, context);
          Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) =>  const Login()
                ),
             );
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
              'Create account'
            ),
          ),
          const SizedBox(
            height: 40,
          ),

          TextFormField(
            controller: _userNameController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: const InputDecoration(
              labelText: 'Username'
            ),
            validator: appValidator.validateUsername,
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: _phoneController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: const InputDecoration(
              labelText: 'Phone Number',
            ),
            validator: appValidator.validatePhoneNumber
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
              :const Text("Create"))),
            const SizedBox(
              height: 20,
            ),
            TextButton(onPressed: (){ 
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) =>  const Login()
                ),
             );
            }, child: const Text('Login'))            
         ], 
        ))
    );
  }
}
