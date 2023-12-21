import 'package:flutter/material.dart';

import '../widgets/my_drawer.dart';

class ExpenseScreen extends StatefulWidget {
  static const routeName = '/expense-screen';

  @override 
  State<ExpenseScreen> createState() => ExpenseScreenState();
}

class ExpenseScreenState extends State<ExpenseScreen> {
  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColorLight,
        toolbarHeight: 120,
        title: Text('EXPENSES'),
      ),
    );
  }
}