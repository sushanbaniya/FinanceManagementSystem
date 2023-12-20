import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import './screens/home.dart';
import './screens/about.dart';
import './screens/tax_screen.dart';

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
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColorLight: Colors.pink,
        primaryColorDark: Colors.black,
        textTheme: TextTheme(
          bodyMedium: TextStyle(
            color: Colors.white,
            fontSize: 18,
            letterSpacing: 6,
            fontFamily: GoogleFonts.adventPro().fontFamily,
          ),
        ),
      ),
      routes: {
        HomePage.routeName: (context) => HomePage(),
        About.routeName: (context) => About(),
        TaxScreen.routeName: (context) => TaxScreen(),
      },
    );
  }
}
