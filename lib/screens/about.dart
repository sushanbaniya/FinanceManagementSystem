import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets/my_drawer.dart';

class About extends StatelessWidget {
  static const routeName = '/about';

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColorDark,
      drawer: MyDrawer(),
      appBar: AppBar(
        title: Text('ABOUT'),
        backgroundColor: Theme.of(context).primaryColorLight,
        toolbarHeight: 80,
      ),
      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('PROJECT WORK DONE BY:'),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(FontAwesomeIcons.user, color: Colors.white,),
              Text('SUSHAN BANIYA'),
            ],
          ),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(FontAwesomeIcons.user, color: Colors.white,),
              Text('AAKASH KUMAR SHAH'),
            ],
          ),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(FontAwesomeIcons.user, color: Colors.white,),
              Text('SUDAN KHANAL'),
            ],
          ),
        ],
      ))
      
    );
  }
}