import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news1/apis/apiManager.dart';
import 'package:news1/home/HomeTabsScreen.dart';
import 'package:news1/model/SourcesResponse.dart';

//1947b8bf5ffd45ef81c6aea209c2cd4e
class HomeScreen extends StatefulWidget {
  static const ROUTE_NAME = "Home";

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<SourcesResponse> newsFuture;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    newsFuture = getNewsSources();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Route news app"),
          shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50)),
          ),
        ),
        drawer: Container(),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/pattern.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: FutureBuilder<SourcesResponse>(
            future: newsFuture,
            builder: (builContext, snapShot) {
              if (snapShot.hasData) {
                return HomeTabs(snapShot.data.sources);
              } else if (snapShot.hasError) {
                return Center(
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Theme.of(context).primaryColor),
                    ),
                      onPressed:() {
                      setState(() {
                        newsFuture = getNewsSources();
                      });
                      },
                      child: Text('Reload'),
                  ),
                );

              }
              return Center(child: CircularProgressIndicator());
            },
          ),
        ));
  }
}
