import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(500),
      ),
      backgroundColor: Theme.of(context).primaryColorLight,
      child: ListView(
        children: [
          SizedBox(height: 200),
          ListTile(
            leading: Icon(FontAwesomeIcons.moneyBillTransfer, color: Colors.white,)
            // CircleAvatar(child: Icon(Icons.attach_money, color: Colors.black),)
             ,
            title: Text(
              'EXPENSES',
              style: Theme.of(context).textTheme.bodyMedium,
              
            ),
            onTap: () {},
          ),
          SizedBox(height: 30),
          ListTile(
            leading: Icon(FontAwesomeIcons.moneyBillTrendUp, color: Colors.white,)
            // CircleAvatar(child: Icon(Icons.attach_money, color: Colors.black),)
             ,
            title: Text(
              'INCOME',
              style: Theme.of(context).textTheme.bodyMedium,
              
            ),
            onTap: () {},
          ),
          SizedBox(height: 30),
          ListTile(
            leading: Icon(FontAwesomeIcons.calculator, color: Colors.white,)
            // CircleAvatar(child: Icon(Icons.attach_money, color: Colors.black),)
             ,
            title: Text(
              'TAX CALCULATION',
              style: Theme.of(context).textTheme.bodyMedium,
              
            ),
            onTap: () {},
          ),
          SizedBox(height: 30),
          ListTile(
            leading: Icon(FontAwesomeIcons.bank, color: Colors.white,)
            // CircleAvatar(child: Icon(Icons.attach_money, color: Colors.black),)
             ,
            title: Text(
              'INTEREST CALCULATOR',
              style: Theme.of(context).textTheme.bodyMedium,
              
            ),
            onTap: () {},
          ),
          SizedBox(height: 30),
          ListTile(
            leading: Icon(FontAwesomeIcons.user, color: Colors.white,)
            // CircleAvatar(child: Icon(Icons.attach_money, color: Colors.black),)
             ,
            title: Text(
              'ABOUT',
              style: Theme.of(context).textTheme.bodyMedium,
              
            ),
            onTap: () {},
          ),
          SizedBox(height: 30),
        ],
      ),
    );
  }
}