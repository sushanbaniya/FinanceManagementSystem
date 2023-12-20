import 'package:flutter/material.dart';

import '../widgets/my_drawer.dart';

class TaxScreen extends StatefulWidget {
  static const routeName = '/tax-screen';

  @override
  State<TaxScreen> createState() => TaxScreenState();
}

class TaxScreenState extends State<TaxScreen> {
  var income;
  var taxAmount;
  final formKey = GlobalKey<FormState>();

  void taxCalculation() {
    int incomeAmount = int.parse(income);

    if (incomeAmount <= 500000) {
      taxAmount = 0.01 * incomeAmount;
    } else if (incomeAmount > 500000 && incomeAmount <= 700000) {
      taxAmount = 0.1 * incomeAmount;
    } else if (incomeAmount > 700000 && incomeAmount < 1000000) {
      taxAmount = 0.2 * incomeAmount;
    } else if (incomeAmount > 1000000 && incomeAmount < 2000000) {
      taxAmount = 0.3 * incomeAmount;
    } else if (incomeAmount > 2000000 && incomeAmount < 5000000) {
      taxAmount = 0.36 * incomeAmount;
    } else if (incomeAmount > 5000000) {
      taxAmount = 0.39 * incomeAmount;
    }
    setState((){});
    print(incomeAmount);
    print(taxAmount);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Theme.of(context).primaryColorDark,
      drawer: MyDrawer(),
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColorLight,
        title: Text('TAX CALCULATOR'),
        toolbarHeight: 120,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 100),
            Form(
              key: formKey,
              child: Container(
                // color: Colors.white,
                child: TextFormField(  
                           
                    textAlign: TextAlign.center,
                    cursorColor: Colors.pink,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      
                        hintText: 'ENTER YEARLY INCOME',
                        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:Colors.pink, width: 4)),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.pink,
                            width: 8,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(50),
                          ),
                        ),
                        hintStyle: TextStyle(letterSpacing: 9)),
                    keyboardType: TextInputType.number,
                    onSaved: (newValue) {
                      income = newValue;
                    }),
              ),
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
              onPressed: () {
                // calculation();
      
                formKey.currentState!.save();
                taxCalculation();
              },
            ),
            SizedBox(height: 50),
            Container(
              decoration: BoxDecoration(color: Colors.pink, border: Border.all(color: Colors.black, width: 2,),),  
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(2),
              child: taxAmount == null ? Text('') : Text(
                'Tax Amount for Rs. $income is Rs. $taxAmount', style: TextStyle(color: Colors.black, fontSize: 40,),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
