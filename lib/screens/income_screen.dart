import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets/my_drawer.dart';

class IncomeScreen extends StatefulWidget {
  static const routeName = '/income-screen';

  @override
  State<IncomeScreen> createState() => IncomeScreenState();
}

class IncomeScreenState extends State<IncomeScreen> {
  var incomeForm = GlobalKey<FormState>();
  var incomeSource;
  var incomeAmount;

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
                onPressed: () {},
              )
            ]),
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
                            }
                          ),
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
                            }
                          ),
                          
                          SizedBox(height: 30),
                          ElevatedButton(  
                            style: ElevatedButton.styleFrom(  
                              backgroundColor: Theme.of(context).primaryColorDark,
                            ),
                            child: Text('Track this Income !'),
                            onPressed: (){
                              incomeForm.currentState!.save();
                              Navigator.of(context).pop();
                              print(incomeSource);
                              print(incomeAmount);
                            }
                          )

                        ],
                      ),
                    ),
                  );
                });
          },
        ));
  }
}
