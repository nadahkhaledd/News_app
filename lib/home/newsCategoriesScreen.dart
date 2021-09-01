import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'item.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class newsCategoriesScreen extends StatefulWidget {
  static const routeName = 'newsCategoriesScreen';
  Function onCategoryItemClick;
  newsCategoriesScreen(this.onCategoryItemClick);

  @override
  _newsCategoriesScreenState createState() => _newsCategoriesScreenState();
}

class _newsCategoriesScreenState extends State<newsCategoriesScreen> {

  late List<CategoryData> categoryList;
  @override
  Widget build(BuildContext context) {

    categoryList = getCategories();

    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/pattern.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: GridView.builder(
            shrinkWrap: true,
            gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
                mainAxisSpacing: 17,
                crossAxisSpacing: 15
            ) ,
            itemBuilder: (buildContext,index)=>item(categoryList[index],widget.onCategoryItemClick),
            itemCount: categoryList.length,

          ),
        ),
      );
  }

  List<CategoryData> getCategories()
  {
    List<CategoryData> categories = [
    CategoryData(
        'assets/icons/redBorder.png',
        'assets/icons/sports.png',
        AppLocalizations.of(context)!.sports),

      CategoryData(
          'assets/icons/blueBorder.png',
          'assets/icons/politics.png',
          AppLocalizations.of(context)!.politics),

      CategoryData(
          'assets/icons/pinkBorder.png',
          'assets/icons/health.png',
          AppLocalizations.of(context)!.health),

      CategoryData(
          'assets/icons/brown.png',
          'assets/icons/business.png',
          AppLocalizations.of(context)!.business),

      CategoryData(
          'assets/icons/lightBlue.png',
          'assets/icons/environment.png',
          AppLocalizations.of(context)!.environment),

      CategoryData(
          'assets/icons/yellow.png',
          'assets/icons/science.png',
          AppLocalizations.of(context)!.science)
    ];

    return categories;
  }
}
