import 'package:flutter/material.dart';
import 'package:news_app/APIs/APImanager.dart';
import 'package:news_app/model/NewsResponse.dart';
import 'package:news_app/model/Source.dart';
import '../NewsDetails/NewsListItem.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../AppConfigProvider.dart';
import 'NewsListItem.dart';

class NewsFragment extends StatefulWidget {
  Source source;
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
                return newsListItem(snapshot.data!.articles[index], context);
              },
              itemCount: snapshot.data!.articles.length,
            );
          } else if (snapshot.hasError) {
            print(snapshot.error);
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
