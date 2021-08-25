import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:news_app/APIs/APImanager.dart';
import 'package:news_app/model/NewsResponse.dart';
import 'package:news_app/model/Source.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/model/NewsResponse.dart';
import 'package:news_app/model/Source.dart';
import 'package:news_app/model/SourcesRespone.dart';
import 'SelectedSource.dart';
import 'package:news_app/NewsDetails/NewsListItem.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SearchResult extends StatefulWidget {
  Source source;
  String Keyword;
  SearchResult(this.source, this.Keyword);
  @override
  _SearchResultState createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {
  late Future<NewsResponse> newsFuture;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<NewsResponse>(
        future: newsFuture = loadNewsAfterSearch(widget.Keyword, widget.source),
        builder: (BuildContext, snapshot) {
          if (snapshot.hasData) {
            //print("widget.search");
            return ListView.builder(
              itemBuilder: (context, index) {
                return newsListItem(snapshot.data!.articles[index], context);
              },
              itemCount: snapshot.data!.articles.length,
            );
          } else if (snapshot.hasError) {
            return Center(
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Theme.of(context).primaryColor),
                ),
                onPressed: () {
                  setState(() {
                    newsFuture =
                        loadNewsAfterSearch(widget.Keyword, widget.source);
                  });
                },
                child: Text(AppLocalizations.of(context)!.reload),
              ),
            );
          } else {
            return Center(
                child: CircularProgressIndicator(
                    backgroundColor: Theme.of(context).primaryColor));
          }
        },
      ),
    );
  }
}
