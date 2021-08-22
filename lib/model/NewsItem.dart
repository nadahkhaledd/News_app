
import 'package:news1/model/SourcesResponse.dart';

import 'Source.dart';

class NewsItem {

  Source source;
  Object author;
  String title;
  String description;
  String url;
  String urlToImage;
  String publishedAt;
  String content;

	NewsItem.fromJsonMap(Map<String, dynamic> map):
		source = Source.fromJson(map["source"]),
		author = map["author"],
		title = map["title"],
		description = map["description"],
		url = map["url"],
		urlToImage = map["urlToImage"],
		publishedAt = map["publishedAt"],
		content = map["content"];


}
