

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:news_app/APIs/APImanager.dart';
import 'package:news_app/model/NewsResponse.dart';
import 'package:news_app/model/Source.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/model/NewsResponse.dart';
import 'package:news_app/model/Source.dart';
import 'package:news_app/model/SourcesRespone.dart';



import 'NewsListItem.dart';

class SearchResult extends StatefulWidget {
  Source source;
  String search;
  SearchResult(this.source,this.search);

  @override
  _SearchResultState createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {
  late Future <NewsResponse> newsFuture;

  @override
  void initState() {
    super.initState();
    newsFuture=loadNewsAfterSearch(widget.search);
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<NewsResponse>(
        future: newsFuture,
        builder: (BuildContext,snapshot){
          if(snapshot.hasData)
          {
            return ListView.builder(
              itemBuilder: (context,index){
                print(snapshot.data!.articles[index]);
                return newsListItem(snapshot.data!.articles[index]);
              },
              itemCount: snapshot.data!.articles.length,

            );
          }
          else if(snapshot.hasError){
            return Center(
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Theme.of(context).primaryColor),
                ),
                onPressed:() {
                  setState(() {

                    newsFuture=loadNewsAfterSearch(widget.search);


                  });
                },
                child: Text('Reload'),
              ),
            );
          }
          else{
            return Center(
                child:CircularProgressIndicator(color: Theme.of(context).primaryColor)
            );
          }
        },
      ),
    );
  }
}