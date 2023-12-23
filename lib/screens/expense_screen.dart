import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;

import '../widgets/my_drawer.dart';
import '../models/expense_model.dart';

class ExpenseScreen extends StatefulWidget {
  static const routeName = '/expense-screen';

  @override
  State<ExpenseScreen> createState() => ExpenseScreenState();
}

class ExpenseScreenState extends State<ExpenseScreen> {
  var id;
  var title;
  var price;
  var expensesList = [];
  final expenseForm = GlobalKey<FormState>();

  void addExpense(var Rtitle, var Rprice) async {
    // print(Rtitle);

    // setState(
    //   () {
    //     expensesList.add(
    //       ExpenseModel(
    //           id: DateTime.now().toString(), Rtitle: Rtitle, Rprice: Rprice),
    //     );
    //   },
    // );

    //adding to dabase

    var url =
        'https://financemanagementsystem17-default-rtdb.firebaseio.com/expenses.json';
    await http.post(
      Uri.parse(url),
      body: json.encode(
        {
          'id': DateTime.now().toString(),
          'title': Rtitle,
          'price': Rprice,
        },
      ),
    );

    setState(() {
      fetchData();
    });

    // print(expensesList[0].title);
  }

  // void fetchData() async {
  //   var url = 'https://financemanagementsystem17-default-rtdb.firebaseio.com/expenses.json';
  //   var response = await http.get(Uri.parse(url),);
  //   final extractedData = json.decode(response.body) as Map<String, dynamic>;
  //   // print(data);
  //   var extractedExpenses = [];
  //   extractedData.forEach((expensesId, expensesValue) {
  //     extractedExpenses.add(
  //       ExpenseModel(
  //         id: DateTime.now().toString(),
  //         Rtitle: expensesValue['title'],
  //         Rprice: expensesValue['price']
  //       )
  //      );
  //   });
  //   setState((){
  //     expensesList = extractedExpenses;
  //   });
  // }

  void fetchData() async {
    var url =
        'https://financemanagementsystem17-default-rtdb.firebaseio.com/expenses.json';
    var response = await http.get(Uri.parse(url));
    var extractedData = json.decode(response.body) as Map<String, dynamic>;
    var extractedExpenses = [];
    extractedData.forEach(
      (expensesId, expensesValue) {
        extractedExpenses.add(
          ExpenseModel(
            id: DateTime.now().toString(),
            Rtitle: expensesValue['title'],
            Rprice: expensesValue['price'],
          ),
        );
      },
    );
    setState(
      () {
        expensesList = extractedExpenses;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColorLight,
          toolbarHeight: 120,
          title: Text('EXPENSES'),
          actions: [
            IconButton(
                icon: Icon(FontAwesomeIcons.refresh),
                onPressed: () {
                  fetchData();
                })
          ]),
      body: SingleChildScrollView(
        child: Column(
          children: expensesList.isEmpty
              ? [
                  Container(
                    margin: EdgeInsets.all(30),
                    child: Text(
                      'TAP ADD ICON AT BOTTOM TO ADD EXPENSES',
                      style: TextStyle(
                        color: Theme.of(context).primaryColorDark,
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  Container(
                    margin: EdgeInsets.all(18),
                    child: Text(
                      'OR',
                      style: TextStyle(
                        color: Theme.of(context).primaryColorDark,
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  Container(
                    margin: EdgeInsets.all(30),
                    child: Text(
                      'TAP REFRESH ICON AT TOP TO VIEW MOST RECENT EXPENSES',
                      style: TextStyle(
                        color: Theme.of(context).primaryColorDark,
                      ),
                    ),
                  ),
                ]
              : expensesList.map(
                  (item) {
                    return Card(
                      margin: EdgeInsets.all(18),
                      child: ListTile(
                        leading: CircleAvatar(
                          child: Icon(FontAwesomeIcons.dollarSign),
                        ),
                        title: Text(item.title.toUpperCase()),
                        subtitle: Text('-Rs.${item.price}'),
                      ),
                    );
                  },
                ).toList(),
        ),
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(FontAwesomeIcons.add),
        backgroundColor: Theme.of(context).primaryColorDark,
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(50),
              ),
            ),
            context: context,
            builder: (context) {
              return Container(
                margin: EdgeInsets.all(20),
                height: MediaQuery.of(context).size.height * 0.6,
                child: Form(
                  key: expenseForm,
                  child: Column(
                    children: [
                      TextFormField(
                        textAlign: TextAlign.center,
                        cursorColor: Theme.of(context).primaryColorLight,
                        decoration: InputDecoration(
                          hintText: 'ENTER TITLE OF EXPENSE',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                              borderSide: BorderSide(
                                width: 5,
                                color: Theme.of(context).primaryColorDark,
                              )),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                            borderSide: BorderSide(
                              width: 5,
                              color: Theme.of(context).primaryColorLight,
                            ),
                          ),
                        ),
                        textInputAction: TextInputAction.next,
                        onSaved: (newValue) {
                          title = newValue;
                        },
                      ),
                      SizedBox(
                        height: 18,
                      ),
                      TextFormField(
                        textAlign: TextAlign.center,
                        cursorColor: Theme.of(context).primaryColorLight,
                        decoration: InputDecoration(
                          hintText: 'ENTER PRICE OF EXPENSE',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                              borderSide: BorderSide(
                                width: 5,
                                color: Theme.of(context).primaryColorDark,
                              )),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                            borderSide: BorderSide(
                              width: 5,
                              color: Theme.of(context).primaryColorLight,
                            ),
                          ),
                        ),
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.number,
                        onSaved: (newValue) {
                          price = newValue;
                        },
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Theme.of(context).primaryColorDark),
                        child: Text('Add This Expense !'),
                        onPressed: () {
                          expenseForm.currentState!.save();
                          addExpense(title, price);
                          Navigator.of(context).pop();
                        },
                      )
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
