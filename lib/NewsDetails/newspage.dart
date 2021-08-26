import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/model/NewsItem.dart';
import 'package:news_app/tools/myThemeData.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NewsPage extends StatelessWidget {
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
            newsItem.title ?? " ",
            style: TextStyle(fontSize: 19.0, fontWeight: FontWeight.w400),
            //  textAlign: TextAlign.right,
          ),
        ),
        //backgroundColor: primaryColor,
        shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(75),
                bottomRight: Radius.circular(75))),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  newsItem.urlToImage ?? " ",
                  height: 200,
                  fit: BoxFit.fill,
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              alignment: Alignment.bottomLeft,
              child: Text(
                newsItem.author.toString(),
                //    textAlign: TextAlign.left,
                style: TextStyle(
                    fontWeight: FontWeight.w400, color: Colors.black45),
              ),
            ),
          ),
          SizedBox(
            height: 8.0,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              newsItem.title ?? " ",
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: Colors.black87,
                  fontSize: 15),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              alignment: Alignment.topRight,
              child: Text(
                newsItem.publishedAt ?? " ",
                style: TextStyle(
                    fontWeight: FontWeight.w400, color: Colors.black45),
              ),
            ),
          ),
          Flexible(
              //newly added
              child: Container(
            padding: EdgeInsets.all(8),
            child: Text(
              newsItem.description ?? " ",
              style: TextStyle(fontSize: 17),
              //  softWrap: true
            ),
          )),
          InkWell(
            onTap: () => _launchURL(newsItem.url ?? ""),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                Text(
                  AppLocalizations.of(context)!.view,
                  style: TextStyle(
                      color: myThemeData.TextColor,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
                Icon(CupertinoIcons.arrow_right_square_fill,
                    color: myThemeData.TextColor, size: 17)
              ]),
            ),
          )
        ],
      ),
    );
  }

  void _launchURL(String _url) async => await canLaunch(_url)
      ? await launch(_url)
      : throw 'Could not launch $_url';
}
