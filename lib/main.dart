import 'package:flutter/material.dart';
import 'package:news_app/home/categories/newsCategoriesScreen.dart';
import '';
import 'package:news_app/myThemeData.dart';

import 'home/HomeScreen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor : myThemeData.primaryColor,
      ),
      routes: {
        newsCategories.ROUTE_NAME:(context)=>newsCategories(),
        HomeScreen.ROUTE_NAME: (context) => HomeScreen(),
      },
      initialRoute: HomeScreen.ROUTE_NAME,

    );
  }
}


