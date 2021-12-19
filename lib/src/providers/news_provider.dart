import 'package:flutter/material.dart';
import 'package:news_provider/src/models/news_models.dart';
import 'package:http/http.dart' as http;

enum HeadlinesStatus { done, empty, loading, error }

const String _newsUrl =
    'https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=5cd92aba75b54094b292ebce5e6bed60';

class NewsProvider with ChangeNotifier {
  List<Article> headlines = [];
  HeadlinesStatus headlinesStatus = HeadlinesStatus.empty;

  NewsProvider() {
    getTopHeadlines();
  }

  getTopHeadlines({String path = _newsUrl}) async {
    try {
      HeadlinesStatus.loading;
      final resp = await http.get(Uri.parse(path));
      if (resp.statusCode == 200) {
        final newsResponse = NewsResponse.fromJson(resp.body);
        headlines.addAll(newsResponse.articles);
        HeadlinesStatus.done;
      } else {
        HeadlinesStatus.empty;
      }
      notifyListeners();
    } catch (err) {
      HeadlinesStatus.error;
    }
  }
}
