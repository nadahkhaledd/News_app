import 'NewsItem.dart';

class NewsResponse {

  String status = '';
  int totalResults = 0;
  List<NewsItem> articles = [];

  NewsResponse(this.status, this.totalResults, this.articles);

   factory NewsResponse.fromJson(Map<String, dynamic> map){
     String status = map["status"];
     int totalResults = map["totalResults"];
     List<NewsItem> articles = List<NewsItem>.from(map["articles"].map((it) => NewsItem.fromJsonMap(it)));
     return NewsResponse(status, totalResults, articles);
  }
}


class SourceMini {
  String id;
  String name;

  SourceMini(
      { required this.id,
        required this.name,
      }
      );

  factory SourceMini.fromJson(Map<String, dynamic> map) {
    return SourceMini(
      id: map['id'],
      name: map['name'],
    );
  }

}