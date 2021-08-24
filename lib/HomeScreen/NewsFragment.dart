import 'package:flutter/material.dart';
import 'package:news_app/APIs/APImanager.dart';
import 'package:news_app/model/NewsResponse.dart';
import 'package:news_app/model/Source.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../AppConfigProvider.dart';
import 'NewsListItem.dart';

class NewsFragment extends StatefulWidget {
  // AppConfigProvider provider = Provider.of<AppConfigProvider>(context);
  Source source;
  // this.source.language = provider.currentLocale;
  NewsFragment(this.source);

  @override
  _NewsFragmentState createState() => _NewsFragmentState();
}

class _NewsFragmentState extends State<NewsFragment> {
  late Future<NewsResponse> newsFuture;
  late AppConfigProvider provider;

  @override
  Widget build(BuildContext context) {

    setState(() {
      provider = Provider.of<AppConfigProvider>(context);
      newsFuture = loadNews(widget.source, provider.currentLocale);

    });
    //provider = Provider.of<AppConfigProvider>(context);
    return Container(
      child: FutureBuilder<NewsResponse>(
        future: newsFuture,
        builder: (BuildContext, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemBuilder: (context, index) {
                return newsListItem(snapshot.data!.articles[index]);
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
                        loadNews(widget.source, provider.currentLocale);
                  });
                },
                child: Text('Reload'),
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
