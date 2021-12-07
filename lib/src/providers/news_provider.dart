import 'package:flutter/material.dart';
import 'package:news_provider/src/models/news_models.dart';

class NewsProvider with ChangeNotifier {
  List<Article> headlines = [];

  NewsProvider() {
    getTopHeadlines();
  }

  getTopHeadlines() {
    print('Loading...');
  }
}
