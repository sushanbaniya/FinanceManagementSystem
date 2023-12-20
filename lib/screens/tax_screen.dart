import 'package:flutter/material.dart';

import '../widgets/my_drawer.dart';

class TaxScreen extends StatefulWidget {
  static const routeName = '/tax-screen';

  @override 
  State<TaxScreen> createState() => TaxScreenState();
}

class TaxScreenState extends State<TaxScreen> {
  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColorLight,
        title: Text('TAX CALCULATOR'),
        toolbarHeight: 120,
      ),
      body: Center(child: Text('screen for taxes'))
    );
  }
}