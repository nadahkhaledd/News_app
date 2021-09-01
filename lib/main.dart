import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:news_app/AppConfigProvider.dart';
import 'package:news_app/HomeScreen/homeScreen.dart';
import 'package:news_app/tools/myThemeData.dart';
import 'home/newsCategoriesScreen.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (BuildContext) => AppConfigProvider(),
        builder: (BuildContext, Widget) {
          final provider = Provider.of<AppConfigProvider>(BuildContext);
          return MaterialApp(
            localizationsDelegates: [
              AppLocalizations.delegate, // Add this line
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            locale: Locale.fromSubtags(languageCode: provider.currentLocale),
            supportedLocales: AppLocalizations.supportedLocales,
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primaryColor: myThemeData.primaryColor,
            ),
            /*routes: {
              newsCategoriesScreen.routeName: (context) => newsCategoriesScreen(),
            },
            initialRoute: homeScreen.routeName,*/
            home: homeScreen(),
          );
        });
  }
}
