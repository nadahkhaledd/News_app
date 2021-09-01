import 'package:flutter/material.dart';
import 'package:news_app/APIs/APImanager.dart';
import 'package:news_app/HomeScreen/searchOption/SearchResultHome.dart';
import 'package:news_app/model/SourcesRespone.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'HomeTabs.dart';

class HomePageWidget extends StatefulWidget {
  late Future<SourcesResponse> newsFuture;
  bool inSearch = false;
  String keyword = "";
  bool check = false;
  String chosenCategory;

  HomePageWidget({required this.newsFuture, required this.chosenCategory,  this.inSearch = false, this.check = false, this.keyword = ''});
  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {

  @override
  void initState() {
    super.initState();
    widget.newsFuture = getCategorizedNewsSources(widget.chosenCategory);
  }

  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/pattern.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: FutureBuilder<SourcesResponse>(
        future: widget.newsFuture,
        builder: (builContext, snapShot) {
          if (snapShot.hasData) {
            return widget.inSearch? AtSearchingHome(snapShot.data!.sources, widget.check, widget.keyword)
                : HomeTabs(snapShot.data!.sources);
          } else if (snapShot.hasError) {
            print(snapShot.error);
            return Center(
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Theme.of(context).primaryColor),
                ),
                onPressed: () {
                  setState(() {
                    widget.newsFuture = getNewsSources();
                  });
                },
                child: Text(AppLocalizations.of(context)!.reload),
              ),
            );
            // assignment reload
          }
          return Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).primaryColor,
              ));
        },
      ),
    );
  }
}
