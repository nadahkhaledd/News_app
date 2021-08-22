class Source {
  String id;
  String name;
  String description;
  String url;
  String category;
  String language;
  String country;

  Source(
      {this.id,
        this.name,
        this.description,
        this.url,
        this.category,
        this.language,
        this.country});

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