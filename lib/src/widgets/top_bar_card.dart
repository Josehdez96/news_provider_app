import 'package:flutter/material.dart';
import 'package:news_provider/src/models/news_models.dart';

class TopBarCard extends StatelessWidget {
  final Article article;
  final int index;

  const TopBarCard({
    Key? key,
    required this.article,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          Text(
            '${index + 1}. ',
            style: const TextStyle(color: Colors.white),
          ),
          const SizedBox(width: 7),
          Text(article.source.name)
        ],
      ),
    );
  }
}
