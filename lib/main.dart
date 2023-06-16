import 'package:flutter/material.dart';
import 'homepage.dart';
import 'package:provider/provider.dart';
import 'config/thememodel.dart';

void main() => runApp(

  MultiProvider(
    providers: [
      ChangeNotifierProvider(create:(_)=>ThemeModel())
    ],
     child: MyApp(),));
// ChangeNotifierProvider<ThemeModel>(
//     builder: (BuildContext context) => ThemeModel(), 
//     child: MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: Provider.of<ThemeModel>(context).currentTheme,
      
      home: MyHomePage() );
      
       
    
  }
}


