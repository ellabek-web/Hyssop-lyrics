import 'package:flutter/material.dart';
import 'homepage.dart';
import 'package:provider/provider.dart';
import 'config/thememodel.dart';
import 'config/favorite_model.dart';
import 'config/font_provider.dart';

void main() => runApp(

  MultiProvider(
    providers: [
      ChangeNotifierProvider(create:(_)=>ThemeModel()),
      ChangeNotifierProvider(create:(context)=>FavoriteModel()),
      ChangeNotifierProvider(create:(context)=>FontModel())

      
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


