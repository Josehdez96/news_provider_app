import 'package:flutter/material.dart';
import 'package:news_provider/src/providers/news_provider.dart';
import 'package:news_provider/src/widgets/news_list.dart';
import 'package:provider/provider.dart';

class Tab1Screen extends StatelessWidget {
  const Tab1Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final newsProvider = Provider.of<NewsProvider>(context);

    return (newsProvider.headlinesStatus == HeadlinesStatus.loading)
        ? const Center(child: CircularProgressIndicator())
        : NewsList(news: newsProvider.headlines);
  }
}
