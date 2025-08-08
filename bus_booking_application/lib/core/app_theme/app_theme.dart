import 'package:flutter/material.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
      primarySwatch: Colors.teal,
      fontFamily: 'Montserrat Bold',
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            textStyle: const TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontFamily: 'Montserrat Bold'),
            backgroundColor: const Color(0xff00FF00),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
      ),
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        color: Colors.yellow,
        elevation: 4,
        shadowColor: Colors.amber,
        titleTextStyle: TextStyle(
            fontSize: 26, color: Colors.teal, fontWeight: FontWeight.bold),
      ));
}
