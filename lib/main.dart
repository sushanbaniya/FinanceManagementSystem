import 'package:flutter/material.dart';

import './screens/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override 
  State<MyApp> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  @override 
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Finance Management System',
      home: HomePage(),
      theme: ThemeData(  
        primaryColorLight: Colors.pink,
        primaryColorDark: Colors.black,
        textTheme: TextTheme(bodyMedium: TextStyle(color: Colors.white, fontSize: 18, letterSpacing: 3,),),
      )
    );
  }
}