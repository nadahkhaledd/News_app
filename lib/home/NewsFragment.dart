import 'package:flutter/material.dart';
import 'package:news1/apis/apiManager.dart';
import 'package:news1/home/NewsListItem.dart';
import 'package:news1/model/NewsResponse.dart';
import 'package:news1/model/Source.dart';
import 'package:news1/model/SourcesResponse.dart';
//will call the api to the passed source
class NewsFragment extends StatefulWidget {
  Source source;
  NewsFragment(this.source);

  @override
  _NewsFragmentState createState() => _NewsFragmentState();
}

class _NewsFragmentState extends State<NewsFragment> {
  Future <NewsResponse> newsFuture;
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
              child:CircularProgressIndicator()
            );
          }
        },
      ),
    );
  }
}
