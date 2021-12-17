import 'package:flutter/material.dart';

class DescriptionCard extends StatelessWidget {
  final String? description;

  const DescriptionCard({
    Key? key,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Text(description ?? ''),
    );
  }
}
