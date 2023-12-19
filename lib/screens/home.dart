import 'package:flutter/material.dart';

import '../widgets/my_drawer.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/home-page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColorDark,
      drawer: MyDrawer(),
      appBar: AppBar(
        title: Column(
          children: [
            Text(
              'FINANCE MANAGEMENT',
              style: TextStyle(
                letterSpacing: 4,
              ),
            ),
            Text(
              'SYSTEM',
              style: TextStyle(
                letterSpacing: 4,
              ),
            ),
          ],
        ),
        toolbarHeight: 270,
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColorLight,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(250),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('MANAGE YOUR FINANCES', ),
            Text('BY TAPPING ON DRAWER',),
          ],
        ),
        
      ),
    );
  }
}
