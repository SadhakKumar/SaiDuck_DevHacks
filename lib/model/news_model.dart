class News{
  String? title;
  String? url;
  String? urlToImage;

  News({
    this.title,
    this.url,
    this.urlToImage});

  News.fromJson(Map<String, dynamic> json){
    title = json["articles"]["title"];
    url = json["articles"]["url"];
    urlToImage = json["articles"]["urlToImage"];
  }
}