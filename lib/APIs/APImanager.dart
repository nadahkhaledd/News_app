import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/model/NewsResponse.dart';
import 'package:news_app/model/Source.dart';
import 'package:news_app/model/SourcesRespone.dart';

//1947b8bf5ffd45ef81c6aea209c2cd4e
//6da3e5226af44ee7a924341c0229ddf0
//f024fa4349204675b01db633fb5c5f6b
Future<SourcesResponse> getNewsSources() async {
  final uri = Uri.https("newsapi.org", "/v2/top-headlines/sources",
      {"apiKey": "1947b8bf5ffd45ef81c6aea209c2cd4e"});
  final response = await http.get(uri);
  print(response.body);
  if (response.statusCode == 200) {
    return SourcesResponse.fromJson(jsonDecode(response.body));
  } else {
    throw Exception(response.body);
  }
}

Future<SourcesResponse> getCategorizedNewsSources(String category) async {
  final uri = Uri.https("newsapi.org", "/v2/top-headlines/sources", {
    "category": category,
    "apiKey": "1947b8bf5ffd45ef81c6aea209c2cd4e",
  });
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
    "apiKey": "1947b8bf5ffd45ef81c6aea209c2cd4e",
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
