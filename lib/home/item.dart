import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/HomeScreen/homeScreen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class item extends StatelessWidget {
  CategoryData category;
  Function onCategoryItemClick;
  item(this.category, this.onCategoryItemClick);
  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: () {
        onCategoryItemClick(category);
      },
      child:  Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(category.imagePath),
              fit: BoxFit.contain,
            ),
          ),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 2,
                child: Center(child:
                Image.asset(category.IconPath)
                ),
              ),
              
              Expanded(
                child: Center(
                  child: Text(category.title, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),),
                ),
              )
            ],
          ),
        ),

    );
  }
}

class CategoryData{
  String imagePath = '';
  String IconPath = '';
  String title = '';

  CategoryData(this.imagePath, this.IconPath, this.title);
}
