import 'package:expense_manager/widgets/category_dropdown_form.dart';
import 'package:flutter/material.dart';

class AddTransaction extends StatefulWidget {
  const AddTransaction({super.key});

  @override
  State<AddTransaction> createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {
  var type = 'credit';
  var category= "Others";
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Title'
              ),
            ),
            TextFormField(
              keyboardType: TextInputType.numberWithOptions(),
              decoration: InputDecoration(
                labelText: 'Amount'
              ),
            ),
            CategoryDropdownForm(
              cattype: category,
              onChanged: (String? value) {              
                  if(value!=null){
                    setState(() {
                      category=value;
                  });
                }
              }
            ),
          DropdownButtonFormField(items: [
            DropdownMenuItem(child: Text('Credit'), value: 'credit'),
            DropdownMenuItem(child: Text('Debit'), value: 'Debit')
          ], onChanged: (value){
            if(value!=null){
              setState(() {
                type=value;
              });
            }
             
          })
          ,
          SizedBox(
            height: 16,
          ),
          ElevatedButton(onPressed: (){}, child: Text("Add transaction"))
          ],
        ),
      ),
    );
  }
}