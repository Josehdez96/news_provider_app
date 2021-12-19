import 'package:flutter/material.dart';
import 'package:news_provider/src/models/category_model.dart';
import 'package:news_provider/src/providers/news_provider.dart';
import 'package:news_provider/src/extensions/string_extension.dart';
import 'package:provider/provider.dart';

class Tab2Screen extends StatelessWidget {
  const Tab2Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categories = Provider.of<NewsProvider>(context).categories;

    return SafeArea(
      child: ListView(
        scrollDirection: Axis.horizontal,
        children:
            categories.map((category) => _CategoryOption(category)).toList(),
      ),
    );
  }
}

class _CategoryOption extends StatelessWidget {
  final Category category;
  const _CategoryOption(this.category, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 110,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            _CategoryIcon(category),
            const SizedBox(height: 5),
            Text((category.name).capitalize()),
          ],
        ),
      ),
    );
  }
}

class _CategoryIcon extends StatelessWidget {
  final Category category;
  const _CategoryIcon(this.category, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('Tapped');
      },
      child: Container(
        width: 40,
        height: 40,
        margin: const EdgeInsets.symmetric(vertical: 8),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
        child: Icon(category.icon, color: Colors.black54),
      ),
    );
  }
}
