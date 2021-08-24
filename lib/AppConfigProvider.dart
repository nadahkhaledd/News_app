import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppConfigProvider extends ChangeNotifier {
  String currentLocale = "en";

  void changeLanguage(String lang) {
    if (currentLocale == lang) return;
    currentLocale = lang;
    notifyListeners();
  }
}
