import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/tools/myThemeData.dart';
import '../Settings.dart';
import '../home/newsCategoriesScreen.dart';

class sideMenu extends Drawer {

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 95,
          title: Center(
            child: Text('News App', style: TextStyle(fontWeight: FontWeight.w800, fontSize: 25),),
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/pattern.png'),
              fit: BoxFit.cover,
            ),
          ),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: InkWell(
                  onTap: ()
                  { Navigator.push(context, MaterialPageRoute(builder: (context) => newsCategoriesScreen()));},
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Image.asset('assets/icons/list.png',),
                      ),
                       Text('Categories', style: TextStyle(color: myThemeData.TextColor, fontSize: 25, fontWeight: FontWeight.w600),),
                    ],
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(10.0),
                child: InkWell(
                    onTap: ()
                    { Navigator.push(context, MaterialPageRoute(builder: (context) => Settings()));},
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Image.asset('assets/icons/settings.png',),
                      ),
                      Text('Settings', style: TextStyle(color: myThemeData.TextColor, fontSize: 25, fontWeight: FontWeight.w600),)
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
