import 'package:dima/expenses_app/ui/exe_home_screen.dart';
import 'package:flutter/material.dart';


void main() {
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  //   DeviceOrientation.portraitDown,
  // ]);
  runApp(MaterialApp(
    theme: ThemeData(
      primarySwatch: Colors.purple,
      // ignore: deprecated_member_use
      accentColor: Colors.deepPurple,
      fontFamily: 'Quicksand',
      appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
        fontFamily: 'OpenSans',
        fontSize: 20,
        fontWeight: FontWeight.bold,
      )),
      textTheme: const TextTheme(
        titleMedium: TextStyle(
          fontFamily: 'OpenSans',
          fontSize: 19,
        ),
      ),
    ),
    home: const ExpensesHome(),
  ));
}
