class SourcesResponse {
   String status;
   List<Source> sources;

  SourcesResponse({required this.status, required this.sources});

  factory SourcesResponse.fromJson(Map<String, dynamic> map) {
    List list = map['sources'];
    List<Source> sources = list.map((d) => Source.fromJson(d)).toList();
    return SourcesResponse(status: map['status'], sources: sources);
  }
}

class Source {
  String id;
  String name;
  String description;
  String url;
  String category;
  String language;
  String country;

  Source(
      {required this.id,
        required this.name,
        required this.description,
        required this.url,
        required this.category,
        required this.language,
        required this.country});

  factory Source.fromJson(Map<String, dynamic> map) {
    return Source(
      id: map['id'],
      name: map['name'],
      description: map['description'],
      url: map['url'],
      category: map['category'],
      language: map['language'],
      country: map['country'],
    );
  }
}
