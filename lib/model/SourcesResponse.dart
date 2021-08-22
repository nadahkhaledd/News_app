import 'Source.dart';

class SourcesResponse {
  String status;
  List<Source> sources;

  SourcesResponse({this.status, this.sources});

  factory SourcesResponse.fromJson(Map<String, dynamic> map) {
    List list = map['sources'];
    //to convert the list of dynamics to a list of sources
    List<Source> sources = list.map((d) => Source.fromJson(d)).toList();
    return SourcesResponse(status: map['status'], sources: sources);
  }
}


