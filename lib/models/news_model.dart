class Welcome {
  int id;
  String title;
  String content;
  String imageUrl;
  String author;
  DateTime publishDate;
  String category;

  Welcome({
    required this.id,
    required this.title,
    required this.content,
    required this.imageUrl,
    required this.author,
    required this.publishDate,
    required this.category,
  });

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
    id: json["id"],
    title: json["title"],
    content: json["content"],
    imageUrl: json["imageUrl"],
    author: json["author"],
    publishDate: DateTime.parse(json["publishDate"]),
    category: json["category"],
  );
}
