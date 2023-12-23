import 'package:flutter/material.dart';

import '../widgets/my_drawer.dart';

class IncomeScreen extends StatefulWidget {
  static const routeName = '/income-screen';
  
  @override 
  State<IncomeScreen> createState() => IncomeScreenState();
  }

class IncomeScreenState extends State<IncomeScreen> {
  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: Text('INCOMES'),
        toolbarHeight: 120,
        backgroundColor: Theme.of(context).primaryColorLight,
      ),
    );
  }
}