import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/model/NewsResponse.dart';
import 'package:news_app/model/Source.dart';
import 'package:news_app/model/SourcesRespone.dart';
import 'package:provider/provider.dart';

import '../AppConfigProvider.dart';

//1947b8bf5ffd45ef81c6aea209c2cd4e
//6da3e5226af44ee7a924341c0229ddf0

Future<SourcesResponse> getNewsSources() async {
  final uri = Uri.https("newsapi.org", "/v2/top-headlines/sources",
      {"apiKey": "6da3e5226af44ee7a924341c0229ddf0"});
  final response = await http.get(uri);
  print(response.body);
  if (response.statusCode == 200) {
    return SourcesResponse.fromJson(jsonDecode(response.body));
  } else {
    throw Exception(response.body);
  }
}

Future<NewsResponse> loadNews(Source source, String lang) async {
  final uri = Uri.https("newsapi.org", "/v2/everything", {
    "apiKey": "6da3e5226af44ee7a924341c0229ddf0",
    "sources": source.id,
    "language": lang,
  });
  final response = await http.get(uri);
  if (response.statusCode == 200) {
    return NewsResponse.fromJson(jsonDecode(response.body));
  } else {
    throw Exception(response.body);
  }
}
