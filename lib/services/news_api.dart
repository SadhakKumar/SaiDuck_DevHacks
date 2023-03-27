import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:devhacks/model/news_model.dart';

class NewsApiClient{
  Future<News>? getNews() async{
    var endpoint = Uri.parse("https://newsapi.org/v2/everything?q=natural&apiKey=f1d98930f4a343bd835f521a4071dada");

    var response = await http.get(endpoint);
    var body = jsonDecode(response.body);
    print(News.fromJson(body).title);
    return News.fromJson(body);
  }

}