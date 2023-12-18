import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColorDark,
      drawer: Drawer(),
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
        child: Text('TAP ON DRAWER FOR ACTIONS',),
      ),
    );
  }
}
