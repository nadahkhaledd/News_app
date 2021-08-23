
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/model/NewsItem.dart';

class NewsPage extends StatelessWidget
{
  late NewsItem newsItem;
  NewsPage(this.newsItem);
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       toolbarHeight: 70.0,
       centerTitle: true,
       title: Center(
         child: Text(
           'News title',
           style: TextStyle(
               fontSize: 19.0,
               fontWeight: FontWeight.w400
           ),
           //  textAlign: TextAlign.right,
         ),
       ),
       //backgroundColor: primaryColor,
       shape: ContinuousRectangleBorder(
           borderRadius: BorderRadius.only(
               bottomLeft: Radius.circular(75),
               bottomRight: Radius.circular(75)
           )
       ),
     ),
     body: Column(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(

                newsItem.urlToImage,
                height: 240,
                fit: BoxFit.cover,
              )),
          Text(
            newsItem.author.toString(),
            textAlign: TextAlign.start,
            style:
            TextStyle(fontWeight: FontWeight.w400, color: Colors.black45),
          ),
          SizedBox(
            height: 8.0,
          ),
          Text(
            newsItem.title,
            textAlign: TextAlign.start,
            style:
            TextStyle(fontWeight: FontWeight.w700, color: Colors.black87),
          ),
          SizedBox(
            height: 10.0,
          ),


          Text(
          newsItem.content,
    textAlign: TextAlign.end,
    style:
    TextStyle(fontWeight: FontWeight.w500, color: Colors.black,),
            overflow: TextOverflow.ellipsis,

          ),



        ],
       ),


   );
  }

}