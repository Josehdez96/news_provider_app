import 'package:flutter/material.dart';
import 'package:news_provider/src/models/news_models.dart';
import 'package:news_provider/src/widgets/description_card.dart';
import 'package:news_provider/src/widgets/image_card.dart';
import 'package:news_provider/src/widgets/title_card.dart';
import 'package:news_provider/src/widgets/top_bar_card.dart';

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
        return _Article(article: news[index], index: index);
      },
    );
  }
}

class _Article extends StatelessWidget {
  final Article article;
  final int index;

  const _Article({
    required this.article,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 15),
        TopBarCard(article: article, index: index),
        TitleCard(article: article, index: index),
        ImageCard(imageUrl: article.urlToImage),
        DescriptionCard(description: article.description),
        const Divider(height: 20)
      ],
    );
  }
}
