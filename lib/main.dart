import 'package:flutter/material.dart';
//import 'package:news1/myThemeData.dart';
import 'package:news_app/myThemeData.dart';
import 'home/newsCategoriesScreen.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor : myThemeData.primaryColor,
      ),
      routes: {
        newsCategoriesScreen.routeName:(context)=>newsCategoriesScreen(),
      },
      initialRoute: newsCategoriesScreen.routeName,

    );
  }
}


