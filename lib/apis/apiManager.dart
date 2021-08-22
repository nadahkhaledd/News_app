import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/model/NewsResponse.dart';
import 'package:news_app/model/Source.dart';
import 'package:news_app/model/SourcesResponse.dart';

Future<SourcesResponse> getNewsSources() async {
  final uri = Uri.https("newsapi.org", "/v2/top-headlines/sources",
      {"apiKey": "1947b8bf5ffd45ef81c6aea209c2cd4e"}
      );
  final response = await http.get(uri);
  //print(response.body);
  if (response.statusCode == 200) {
    return SourcesResponse.fromJson(jsonDecode(response.body));
  } else {
    throw Exception(response.body);
  }
}

Future <NewsResponse>loadNews(Source source) async {
  final uri = Uri.https("newsapi.org", "/v2/everything",
      {"apiKey": "1947b8bf5ffd45ef81c6aea209c2cd4e", "sources": source.id}
      );
  final response = await http.get(uri);
  if (response.statusCode == 200) {
    return NewsResponse.fromJsonMap(jsonDecode(response.body));
  }
  else {
    throw Exception(response.body);
  }
}
