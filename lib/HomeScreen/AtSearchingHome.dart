import 'package:flutter/material.dart';
import 'package:news_app/HomeScreen/SearchResult.dart';
import 'package:news_app/model/NewsResponse.dart';
import 'package:news_app/model/Source.dart' ;
import 'NewsFragment.dart';
import 'TabItem.dart';

class AtSearchingHome extends StatefulWidget {
  List<Source> sources;
//  List<SourceMini> sourcesMini = [];
  AtSearchingHome(this.sources);

  @override
  _AtSearchingHomeState createState() => _AtSearchingHomeState();
}

class _AtSearchingHomeState extends State<AtSearchingHome> {
  int selectedIndex = 0;
  void hey(String value)
  {
    setState(() {
      v=value;
    });
  }
  String v="";
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: widget.sources.length,
        child: Container(
          padding: EdgeInsets.only(top: 8),
          child: Column(
            children: [
              TextField(
                onSubmitted: (String value) async {
                  hey(value);

                },
                decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20)))),
              ),

              Expanded(
                child: TabBarView(
                  children:
                  widget.sources.map((source) => SearchResult(source,v)).toList(),

                ),
              ),
            ],
          ),
        ));
  }
}