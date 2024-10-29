import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class AppIcons{
    final List<Map<String, dynamic>> homeExpenseCategories=[
    {
      "name": "Grocery",
      "icon": FontAwesomeIcons.shoppingCart,
    },
    {
      "name": "Milk",
      "icon": FontAwesomeIcons.mugHot,
    },
    {
      "name": "Internet",
      "icon": FontAwesomeIcons.wifi,
    },
    {
      "name": "clothing",
      "icon": FontAwesomeIcons.shirt,
    },
    {
      "name": "Insurance",
      "icon": FontAwesomeIcons.shield,
    },
    {
      "name": "Education",
      "icon": FontAwesomeIcons.graduationCap,
    },
    {
      "name": "Movie",
      "icon": FontAwesomeIcons.film,
    },
    {
      "name": "Healthcare",
      "icon": FontAwesomeIcons.kitMedical,
    },
    {
      "name": "Rent",
      "icon": FontAwesomeIcons.house,
    },
    {
      "name": "Phone Bill",
      "icon": FontAwesomeIcons.phone,
    },
    {
      "name": "Transportation",
      "icon": FontAwesomeIcons.bus,
    },
    {
      "name": "water",
      "icon": FontAwesomeIcons.water,
    }, 
    {
      'name': 'Others',
      'icon': FontAwesomeIcons.cartPlus,
    },   
  ];
  IconData getExpenseCategoryIcons(String CategoryName){
    final Category=homeExpenseCategories.firstWhere(
      (category)=> category['name']==CategoryName, 
      orElse: ()=>{"icon" : FontAwesomeIcons.shoppingCart});
      return Category['icon'];
  }
} 