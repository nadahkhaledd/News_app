import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/APIs/APImanager.dart';
import 'package:news_app/model/SourcesRespone.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../sideMenu.dart';
import 'HomeTabs.dart';

class homeScreen extends StatefulWidget {
  String chosenCategory;
  homeScreen(this.chosenCategory);

  @override
  _homeScreenState createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {

   late Future<SourcesResponse> newsFuture;
  @override
  void initState() {
    super.initState();
    newsFuture = getCategorizedNewsSources(widget.chosenCategory);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70.0,
        centerTitle: true,
        title: Center(
          child: Text(
            AppLocalizations.of(context)!.home,
            style: TextStyle(fontSize: 19.0, fontWeight: FontWeight.w400),
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

      drawer: sideMenu(),

      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/pattern.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: FutureBuilder<SourcesResponse>(
          future: newsFuture,
          builder: (builContext, snapShot) {
            if (snapShot.hasData) {
              return HomeTabs(snapShot.data!.sources);
            } else if (snapShot.hasError) {
              print(snapShot.error);
              return Center(
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Theme.of(context).primaryColor),
                  ),
                  onPressed:() {
                    setState(() {
                      newsFuture = getNewsSources();
                    });
                  },
                  child: Text(AppLocalizations.of(context)!.reload),
                ),
              );
              // assignment reload
            }
            return Center(child: CircularProgressIndicator( color: Theme.of(context).primaryColor,));
          },
        ),
      ),
    );
  }
}
