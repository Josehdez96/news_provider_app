import 'package:flutter/material.dart';
import 'package:news_provider/src/models/news_models.dart';

class NewsList extends StatelessWidget {
  final List<Article> news;
  const NewsList({
    Key? key,
    required this.news,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: news.length,
      itemBuilder: (context, index) {
        return Text(
          news[index].title,
          style: const TextStyle(
            color: Colors.white,
          ),
        );
      },
    );
  }
}
