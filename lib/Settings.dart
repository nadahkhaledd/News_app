import 'package:flutter/material.dart';
import 'package:news_app/SideMenu/sideMenu.dart';
import 'package:news_app/tools/myThemeData.dart';
import 'package:news_app/AppConfigProvider.dart';
import 'SideMenu/sideMenu.dart';
import 'tools/myThemeData.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class Settings extends StatefulWidget {

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {

  List<String> languages = ['English', 'العربية'];
  late AppConfigProvider provider =
      Provider.of<AppConfigProvider>(context, listen: false);

     String language = 'English';
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/pattern.png'),
            fit: BoxFit.cover,
          ),
        ),

        child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                AppLocalizations.of(context)!.lang,
                style: TextStyle(
                    color: myThemeData.TextColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: DropdownButton(
                style: TextStyle(color: myThemeData.primaryColor),
                focusColor: myThemeData.primaryColor,
                //dropdownColor: myThemeData.primaryColor,
                iconDisabledColor: myThemeData.primaryColor,
                iconEnabledColor: myThemeData.primaryColor,
                isExpanded: true,
                value: language,
                items: languages.map((String language) {
                  return DropdownMenuItem<String>(
                    value: language,
                    child: Text(
                      language,
                      style: TextStyle(color: myThemeData.primaryColor),
                    ),
                    onTap: null,
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    language = value.toString();
                    if (language == "English")
                      provider.changeLanguage("en");
                    else
                      provider.changeLanguage("ar");
                  });
                },
              ),
            ),
          ],
        ),
      );
  }
}
