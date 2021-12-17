import 'package:flutter/material.dart';
import 'package:news_provider/src/models/news_models.dart';

class TitleCard extends StatelessWidget {
  final Article article;
  final int index;

  const TitleCard({
    Key? key,
    required this.article,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Text(article.content ?? ''),
    );
  }
}
