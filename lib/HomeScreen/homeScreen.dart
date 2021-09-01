import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/APIs/APImanager.dart';
import 'package:news_app/HomeScreen/HomePageWidget.dart';
import 'package:news_app/Settings.dart';
import 'package:news_app/SideMenu/SideMenuItem.dart';
import 'package:news_app/home/item.dart';
import 'package:news_app/home/newsCategoriesScreen.dart';
import 'package:news_app/model/SourcesRespone.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../SideMenu/sideMenu.dart';

class homeScreen extends StatefulWidget {

  static const routeName = 'homeScreen';
  String chosenCategory = '';

  @override
  _homeScreenState createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  CategoryData? selectedCategory = null;
  bool inSettings = false;
  ///bool inNewsPage = false;

   late Future<SourcesResponse> newsFuture;
  @override
  void initState() {
    super.initState();
    newsFuture = getCategorizedNewsSources(widget.chosenCategory);
  }

  String keyword = "";
  bool check = false;
  bool searching = false;
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
                  if (searching == true)
                    searching = false;
                  else
                    searching = true;
                });
              },
            )
          ],
          toolbarHeight: 70.0,
          centerTitle: true,
          title:  inSettings? Center(
            child: Text(
              AppLocalizations.of(context)!.settings,
              style: TextStyle(fontSize: 19.0, fontWeight: FontWeight.w700),
              //  textAlign: TextAlign.right,
            ),
          ):
          selectedCategory==null ? Center(
            child: Text(
              AppLocalizations.of(context)!.appTitle,
              style: TextStyle(fontSize: 19.0, fontWeight: FontWeight.w700),
              //  textAlign: TextAlign.right,
            ),
          ) : (searching == true
              ? Container(
                  height: 40,
                  child: TextField(
                    onSubmitted: (String value) async {
                      setState(() {
                        keyword = value;
                        check = true;
                      });
                    },
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20)))),
                  ),
                )
              : Center(
                  child: Text(
                    widget.chosenCategory,
                    style:
                        TextStyle(fontSize: 19.0, fontWeight: FontWeight.w400),
                    //  textAlign: TextAlign.right,
                  ),
                )),
          //backgroundColor: primaryColor,
          shape: ContinuousRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(75),
                  bottomRight: Radius.circular(75))),
        ),
        drawer: sideMenu(this.onSideMenuItemClick),
        body: (selectedCategory==null && !inSettings)? newsCategoriesScreen(this.onCategoryItemClick):(selectedCategory!=null && !inSettings)?
        (searching == false
            ? HomePageWidget(newsFuture: newsFuture, chosenCategory: widget.chosenCategory,)
            : HomePageWidget(newsFuture: newsFuture, chosenCategory: widget.chosenCategory, inSearch: true, check: check, keyword: keyword)):(inSettings)?Settings():null

    );
  }

  void onCategoryItemClick(CategoryData category){
    setState(() {
      selectedCategory = category;
      widget.chosenCategory = category.title;
    });
  }

  void onSideMenuItemClick(SideMenuItem sideMenuItem){
    if(sideMenuItem.id == SideMenuItem.CATEGORIES){
      setState(() {
        selectedCategory=null;
        inSettings=false;
      });
    }else if (sideMenuItem.id == SideMenuItem.SETTINGS){
      // to handle
      setState(() {
        inSettings=true;
        selectedCategory=null;
      });
    }
    Navigator.pop(context);
  }
}
