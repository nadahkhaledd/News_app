import 'package:flutter/material.dart';
import 'package:news_app/HomeScreen/SearchResult.dart';
import 'package:news_app/model/NewsResponse.dart';
import 'package:news_app/model/Source.dart';
import 'NewsFragment.dart';
import 'TabItem.dart';

class AtSearchingHome extends StatefulWidget {
  late List<Source> sources;
  AtSearchingHome(this.sources);
  @override
  _AtSearchingHomeState createState() => _AtSearchingHomeState();
}

class _AtSearchingHomeState extends State<AtSearchingHome> {
  void hey(String value)
  {
    setState(() {
      v=value;
    });
  }
  String v="";
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          onSubmitted: (String value) async {
            hey(value);
          },
          decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20)))),
        ),

        DefaultTabController(length: widget.sources.length, child: TabBarView(
          children:
          widget.sources.map((source) => SearchResult(v)).toList(),

        ),)
      ]
    );
  }
}