import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

 ThemeData darkTheme = ThemeData.dark().copyWith(
    primaryColor: Color(0xff1f655d),
    hintColor: Color(0xff40bf7a),
    textTheme: const TextTheme(
        titleLarge: TextStyle(color:Colors.white),
        titleMedium: TextStyle(color: Colors.white, fontSize: 18),
        titleSmall: TextStyle(color: Colors.white, fontSize: 16)),
    appBarTheme: const AppBarTheme(color: Color(0xff1f655d)));

ThemeData lightTheme =  ThemeData.light().copyWith(
    primaryColor: Color.fromARGB(255, 18, 17, 17),
    hintColor: Color(0xff40bf7a),
    textTheme: const TextTheme(
        titleLarge: TextStyle(color: Colors.black,),
        titleMedium: TextStyle(color: Colors.black54,fontSize: 18),
        titleSmall: TextStyle(color:Colors.black54 ,fontSize: 16)),
           appBarTheme: const  AppBarTheme(
        color: Color(0xff1f655d),
        actionsIconTheme: IconThemeData(color: Colors.black54)));