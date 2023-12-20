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
      body: Column(
        children: [
          SizedBox(height: 100),
          TextField(
            
            textAlign: TextAlign.center,
            decoration: InputDecoration(
                hintText: 'ENTER YEARLY INCOME',
              
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.pink,
                    width: 5,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(50),
                  ),
                ),
                hintStyle: TextStyle(letterSpacing: 9)),
            keyboardType: TextInputType.number,
          ),
          SizedBox(height: 50),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              fixedSize: Size.fromWidth(170),
              
              backgroundColor: Theme.of(context).primaryColorDark,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
            ),
            child: Text('CALCULATE TAX !'),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
