import "package:flutter/material.dart";
import 'package:news1/home/NewsFragment.dart';
import 'package:news1/model/Source.dart';
import 'package:news1/model/SourcesResponse.dart';

import 'TabItem.dart';

class HomeTabs extends StatefulWidget {
  List<Source> sources;
  HomeTabs(this.sources);

  @override
  _HomeTabsState createState() => _HomeTabsState();
}

class _HomeTabsState extends State<HomeTabs> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: widget.sources.length,
        child: Container(
          padding: EdgeInsets.only(top: 8),
          child: Column(
            children: [
              TabBar(
                  onTap: (index) {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  indicatorColor: Colors.transparent,
                  isScrollable: true,
                  tabs: widget.sources
                      .map((source) => TabItem(source,
                      widget.sources.indexOf(source) == selectedIndex))
                      .toList()),
              Expanded(
                child: TabBarView(
                  children:
                    widget.sources.map((source) => NewsFragment(source)).toList(),

                ),
              ),
            ],
          ),

        ));
  }
}
