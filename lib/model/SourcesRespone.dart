import 'Source.dart';

class SourcesResponse {
  String status;
  List<Source> sources;

  SourcesResponse({ required this.status,  required this.sources});

  factory SourcesResponse.fromJson(Map<String, dynamic> map) {
    List list = map['sources'];
    List<Source> sources = list.map((d) => Source.fromJson(d)).toList();
    return SourcesResponse(status: map['status'], sources: sources);
  }




