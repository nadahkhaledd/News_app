

import 'package:flutter/material.dart';
import 'package:news_app/APIs/APImanager.dart';
import 'package:news_app/model/NewsResponse.dart';
import 'package:news_app/model/Source.dart';
import 'package:news_app/model/SourcesRespone.dart';

import 'NewsListItem.dart';

class NewsFragment extends StatefulWidget {
  Source source;
  NewsFragment(this.source);

  @override
  _NewsFragmentState createState() => _NewsFragmentState();
}

class _NewsFragmentState extends State<NewsFragment> {
  late Future <NewsResponse> newsFuture;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    newsFuture=loadNews(widget.source);
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
                return newsListItem(snapshot.data.articles[index]);
              },
              itemCount: snapshot.data.articles.length,

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
                    newsFuture=loadNews(widget.source);
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