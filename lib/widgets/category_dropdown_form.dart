import 'package:expense_manager/utils/icon_list.dart';  
import 'package:flutter/material.dart';

class CategoryDropdownForm extends StatelessWidget {
 CategoryDropdownForm({super.key, this.cattype, required this.onChanged});
  final String? cattype;
  final ValueChanged<String?>onChanged;
  var appIcons=AppIcons();
  
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: cattype,
      isExpanded: true,
      hint: Text("Select category"),   
      items: appIcons.homeExpenseCategories
      .map((e) => DropdownMenuItem<String>(
        value: e['name'],
        child: Row(
          children: [
            Icon(
              e['icon'],
              color: Colors.black,
            ),
            SizedBox(
              width: 10,
            ),
            Text(e['name'],
              style: TextStyle(color: Colors.black),
            ),
          ],
        )))
        .toList(),

      onChanged: onChanged,
    );
  }
} 