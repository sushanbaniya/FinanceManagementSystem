import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;

import '../widgets/my_drawer.dart';
import '../models/income_model.dart';

class IncomeScreen extends StatefulWidget {
  static const routeName = '/income-screen';

  @override
  State<IncomeScreen> createState() => IncomeScreenState();
}

class IncomeScreenState extends State<IncomeScreen> {
  var incomeForm = GlobalKey<FormState>();
  var incomeSource;
  var incomeAmount;
  var incomeList = [];

  void addIncome(var incomeSource, var incomeAmount) async {
    // setState(() {
    //   incomeList.add(
    //     IncomeModel(
    //       rId: DateTime.now().toString(),
    //       rIncomeSource: incomeSource,
    //       rIncomeAmount: incomeAmount,
    //     ),
    //   );
    // });

    var url =
        'https://financemanagementsystem17-default-rtdb.firebaseio.com/incomes.json';
    await http.post(Uri.parse(url),
        body: json.encode({
          'id': DateTime.now().toString(),
          'incomeSource': incomeSource,
          'incomeAmount': incomeAmount,
        }));

        fetchIncome();
  }

  void fetchIncome() async {
    // print(1 + 2);
    var url =
        'https://financemanagementsystem17-default-rtdb.firebaseio.com/incomes.json';
    var response = await http.get(Uri.parse(url));
    var extractedData = json.decode(response.body);
    var extractedIncomes = [];
    extractedData.forEach((incomeId, incomeData) {
      extractedIncomes.add(
        IncomeModel(
          rId: DateTime.now().toString(),
          rIncomeSource: incomeData['incomeSource'],
          rIncomeAmount: incomeData['incomeAmount'],
        ),
      );
      setState(() {
        incomeList = extractedIncomes;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: Text('INCOMES'),
        toolbarHeight: 120,
        backgroundColor: Theme.of(context).primaryColorLight,
        actions: [
          IconButton(
            icon: Icon(FontAwesomeIcons.refresh),
            onPressed: () {
              fetchIncome();
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
            children: incomeList.isEmpty
                ? [
                    Container(
                      margin: EdgeInsets.all(18),
                      child: Text(
                        'TAP ADD ICON AT BOTTOM TO ADD INCOMES',
                        style: TextStyle(
                          color: Theme.of(context).primaryColorDark,
                        ),
                      ),
                    ),
                    // SizedBox(height: 10),
                    Container(
                      margin: EdgeInsets.all(18),
                      child: Text(
                        'OR',
                        style: TextStyle(
                          color: Theme.of(context).primaryColorDark,
                        ),
                      ),
                    ),
                    // SizedBox(height: 10),
                    Container(
                      margin: EdgeInsets.all(18),
                      child: Text(
                        'TAP REFRESH ICON AT TOP TO VIEW MOST RECENT INCOMES',
                        style: TextStyle(
                          color: Theme.of(context).primaryColorDark,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                  ]
                : incomeList.map((income) {
                    return Card(
                      margin: EdgeInsets.all(18),
                      child: ListTile(
                        leading: CircleAvatar(
                            child: Icon(
                          FontAwesomeIcons.handHoldingDollar,
                        )),
                        title: Text(income.incomeSource.toUpperCase()),
                        subtitle: Text(
                          '+Rs.${income.incomeAmount}',
                        ),
                      ),
                    );
                  }).toList()),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColorDark,
        child: Icon(FontAwesomeIcons.add),
        onPressed: () {
          showModalBottomSheet(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(50),
              ),
            ),
            context: context,
            builder: (context) {
              return Container(
                margin: EdgeInsets.all(18),
                child: Form(
                  key: incomeForm,
                  child: Column(
                    children: [
                      TextFormField(
                          textAlign: TextAlign.center,
                          cursorColor: Theme.of(context).primaryColorLight,
                          decoration: InputDecoration(
                            hintText: 'ENTER SOURCE OF INCOME',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(30),
                              ),
                              borderSide: BorderSide(
                                  color: Theme.of(context).primaryColorDark,
                                  width: 2),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(30),
                              ),
                              borderSide: BorderSide(
                                  color: Theme.of(context).primaryColorLight,
                                  width: 5),
                            ),
                          ),
                          textInputAction: TextInputAction.next,
                          onSaved: (newValue) {
                            incomeSource = newValue;
                          }),
                      SizedBox(height: 18),
                      TextFormField(
                          textAlign: TextAlign.center,
                          cursorColor: Theme.of(context).primaryColorLight,
                          decoration: InputDecoration(
                            hintText: 'ENTER AMOUNT OF INCOME',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(30),
                              ),
                              borderSide: BorderSide(
                                  color: Theme.of(context).primaryColorDark,
                                  width: 2),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(30),
                              ),
                              borderSide: BorderSide(
                                  color: Theme.of(context).primaryColorLight,
                                  width: 5),
                            ),
                          ),
                          textInputAction: TextInputAction.done,
                          keyboardType: TextInputType.number,
                          onSaved: (newValue) {
                            incomeAmount = newValue;
                          }),
                      SizedBox(height: 30),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(context).primaryColorDark,
                        ),
                        child: Text('Track this Income !'),
                        onPressed: () {
                          incomeForm.currentState!.save();
                          addIncome(incomeSource, incomeAmount);
                          
                          Navigator.of(context).pop();
                          // print(incomeSource);
                          // print(incomeAmount);
                        },
                      ),

                      // Icon(FontAwesomeIcons.filterCircleDollar)

                      ///////
                      // ElevatedButton(
                      //   style: ElevatedButton.styleFrom(
                      //     backgroundColor: Theme.of(context).primaryColorDark,
                      //   ),
                      //   child: Text('temporary fetch !'),
                      //   onPressed: () {

                      //     fetchIncome();
                      //     Navigator.of(context).pop();
                      //     // print(incomeSource);
                      //     // print(incomeAmount);
                      //   },
                      // ),
                      ///////
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
