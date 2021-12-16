import 'package:flutter/material.dart';
import 'package:news_provider/src/models/news_models.dart';
import 'package:http/http.dart' as http;

const String _newsUrl =
    'https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=5cd92aba75b54094b292ebce5e6bed60';

class NewsProvider with ChangeNotifier {
  List<Article> headlines = [];

  NewsProvider() {
    getTopHeadlines();
  }

  getTopHeadlines({String path = _newsUrl}) async {
    try {
      final resp = await http.get(Uri.parse(path));
      if (resp.statusCode == 200) {
        final newsResponse = NewsResponse.fromJson(resp.body);
        headlines.addAll(newsResponse.articles);
        notifyListeners();
      }
    } catch (err) {
      // Do something about loading
      print(err);
    }
  }
}
