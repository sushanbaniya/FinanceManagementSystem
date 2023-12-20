import 'package:flutter/material.dart';

import '../widgets/my_drawer.dart';

class InterestScreen extends StatefulWidget {
  static const routeName = '/interest-screen';

  @override
  State<InterestScreen> createState() => InterestScreenState();
}

class InterestScreenState extends State<InterestScreen> {
  final anotherForm = GlobalKey<FormState>();
  var principal;
  var time;
  var rate;
  var interest;

  void interestCalculator() {
    int principalInt = int.parse(principal);
    int timeInt = int.parse(time);
    int rateInt = int.parse(rate);

    setState(() {
      interest = (principalInt * timeInt * rateInt) / 100;
    });

    print(interest);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColorLight,
        title: Text('INTEREST CALCULATOR'),
        toolbarHeight: 120,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(18),
              child: Form(
                key: anotherForm,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Enter Principal Amount',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(width: 3),
                          borderRadius: BorderRadius.all(
                            Radius.circular(30),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 3,
                              color: Theme.of(context).primaryColorLight),
                          borderRadius: BorderRadius.all(
                            Radius.circular(30),
                          ),
                        ),
                      ),
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      cursorColor: Theme.of(context).primaryColorLight,
                      onSaved: (newValue) {
                        principal = newValue;
                      },
                    ),
                    SizedBox(height: 30),
      
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Enter Duration of Loan in Years',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(width: 3),
                          borderRadius: BorderRadius.all(
                            Radius.circular(30),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 3,
                              color: Theme.of(context).primaryColorLight),
                          borderRadius: BorderRadius.all(
                            Radius.circular(30),
                          ),
                        ),
                      ),
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      cursorColor: Theme.of(context).primaryColorLight,
                      onSaved: (newValue) {
                        time = newValue;
                      },
                    ),
                    SizedBox(height: 30),
      
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Enter Interest Rate in Precentage',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(width: 3),
                          borderRadius: BorderRadius.all(
                            Radius.circular(30),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 3,
                              color: Theme.of(context).primaryColorLight),
                          borderRadius: BorderRadius.all(
                            Radius.circular(30),
                          ),
                        ),
                      ),
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.done,
                      cursorColor: Theme.of(context).primaryColorLight,
                      onSaved: (newValue) {
                        rate = newValue;
                      },
                    ),
                    SizedBox(height: 70),
      
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).primaryColorDark,
                        // shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30)))
                      ),
                      child: Text('CALCULATE INTEREST !'),
                      onPressed: () {
                        anotherForm.currentState!.save();
                        interestCalculator();
                      },
                    ),
                    SizedBox(height: 100),
      
                    Container(
                      child: interest == null
                          ? Text('')
                          : Text(
                              'Interest for Principal amount of Rs. $principal with interest rate of $rate % per year and for duration of $time is Rs. $interest',
                              style: TextStyle(
                                  color: Theme.of(context).primaryColorDark),
                            ),
                    ),
      
                    // TextFormField(
                    //     decoration:
                    //         InputDecoration(hintText: 'Enter Duration of Loan'),
                    //     keyboardType: TextInputType.number,
                    //     onSaved: (newValue) {
                    //       time = newValue;
                    //     }),
                    // SizedBox(height: 30),
                    // TextFormField(
                    //     decoration: InputDecoration(hintText: 'Enter Rate'),
                    //     keyboardType: TextInputType.number,
                    //     onSaved: (newValue) {
                    //       rate = newValue;
                    //     }),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
