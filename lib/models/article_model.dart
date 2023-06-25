class ArticleModel{
  late String title;
  late String url;
  late String urlToImage;
  late String publishedAt;

  ArticleModel({required this.title, required this.url, required this.urlToImage, required this.publishedAt});

  Map<String, dynamic> toMap(){
    return {
      'title':title,
      'url':url,
      'urlToImage':urlToImage,
      'publishedAt':publishedAt,
    };
  }

  ArticleModel.fromMap(Map<String, dynamic> map){
    title = map['title'] ?? '';
    url = map['url'] ?? '';
    urlToImage = map['urlToImage'] ?? '';
    publishedAt = map['publishedAt'] ?? '';
  }
}