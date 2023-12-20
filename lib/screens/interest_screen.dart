import 'package:flutter/material.dart';

import '../widgets/my_drawer.dart';

class InterestScreen extends StatefulWidget {
  static const routeName = '/interest-screen';

  @override 
  State<InterestScreen> createState() => InterestScreenState();
}

class InterestScreenState extends State<InterestScreen> {
  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(  
        backgroundColor: Theme.of(context).primaryColorLight,
        title: Text('INTEREST CALCULATOR'),
        toolbarHeight: 120,
      ),
      
    );
  }
}