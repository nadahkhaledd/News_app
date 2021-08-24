import 'package:flutter/material.dart';
import 'package:news_app/HomeScreen/SearchFragment.dart';
import 'package:news_app/model/NewsResponse.dart';
import 'package:news_app/model/Source.dart' ;
import 'NewsFragment.dart';
import 'TabItem.dart';

class AtSearchingHome extends StatefulWidget {
  List<Source> sources;
  bool check;
  String keyword;
//  List<SourceMini> sourcesMini = [];
  AtSearchingHome(this.sources,this.check,this.keyword);

  @override
  _AtSearchingHomeState createState() => _AtSearchingHomeState();
}

class _AtSearchingHomeState extends State<AtSearchingHome> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {

    return DefaultTabController(

        length: widget.sources.length,
        child: Container(

          padding: EdgeInsets.only(top: 8),
          child: Column(

            children: [


              Expanded(
                child: widget.check==true ?
                TabBarView(

                  children:

                  widget.sources.map((source) => SearchResult(source,widget.keyword)).toList(),


                ):
                TabBarView(
                    children:
                    widget.sources.map((source) => NewsFragment(source)).toList(),

              )
              )
            ],
          ),
        ));
  }
}