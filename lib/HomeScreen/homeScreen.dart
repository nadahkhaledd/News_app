import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/APIs/APImanager.dart';
import 'package:news_app/HomeScreen/SearchResultHome.dart';
import 'package:news_app/model/SourcesRespone.dart';

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
  String keyword="";
  bool check=false;
  bool searching=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {
              setState(() {
                if (searching==true)
                  searching=false;
                else
                  searching=true;
              });

            },
          )
        ],
        toolbarHeight: 70.0,
        centerTitle: true,
        title:searching==true?
        Container(
          height: 40,
          child: TextField(
            onSubmitted: (String value) async {
              setState(() {
                keyword=value;
                check=true;
              });

            },
            decoration: InputDecoration(
                filled: true,
                fillColor:Colors.white,
                enabledBorder: OutlineInputBorder(borderSide: BorderSide( color: Colors.white),borderRadius: BorderRadius.all(Radius.circular(20)))
               , focusedBorder: OutlineInputBorder(borderSide: BorderSide( color: Colors.white),borderRadius: BorderRadius.all(Radius.circular(20)))
        ),

          ),
        ):
         Center(
          child: Text(
            widget.chosenCategory,
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

      drawer: sideMenu(),

      body: searching==false ?
      Container(
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
             // print(snapShot.data!.sources);
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
                  child: Text('Reload'),
                ),
              );
              // assignment reload
            }
            return Center(child: CircularProgressIndicator( color: Theme.of(context).primaryColor,));
          },
        ),
      ):
          Container(
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
                  //print(snapShot.data!.sources);

                  return AtSearchingHome(snapShot.data!.sources,check,keyword);
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
                      child: Text('Reload'),
                    ),
                  );
                  // assignment reload
                }
                return Center(child: CircularProgressIndicator( color: Theme.of(context).primaryColor,));
              },
            ),

          )
    );
  }
}
