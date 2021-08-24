import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/HomeScreen/homeScreen.dart';

class item extends StatelessWidget {
  String imagePath = '';
  String IconPath = '';
  String title = '';
  item(this.imagePath, this.IconPath, this.title);
  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => homeScreen(title)));
      },
      child:  Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.contain,
            ),
          ),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 2,
                child: Center(child:
                Image.asset(IconPath)
                ),
              ),
              
              Expanded(
                child: Center(
                  child: Text(title, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),),
                ),
              )
            ],
          ),
        ),

    );
  }
}
