class ListNews {
  String? author;
  String? title;
  String? description;
  String? urlToImage;
  DateTime? publishedAt;
  String? content;

  ListNews({
    this.author,
    this.title,
    this.description,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  factory ListNews.fromJson(Map<String, dynamic> json) => ListNews(
        author: json["author"],
        title: json["title"],
        description: json["description"],
        urlToImage: json["urlToImage"],
        publishedAt: DateTime.parse(json["publishedAt"]),
        content: json["content"],
      );
}
