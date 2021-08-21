import 'package:flutter/material.dart';
import 'package:news_app/home/newsCategoriesScreen.dart';
import 'package:news_app/myThemeData.dart';
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
        newsCategories.routeName:(context)=>newsCategories(),
      },
      initialRoute: newsCategories.routeName,

    );
  }
}


