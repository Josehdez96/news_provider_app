import 'package:flutter/material.dart';

class ImageCard extends StatelessWidget {
  final String? imageUrl;

  const ImageCard({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(50),
        bottomRight: Radius.circular(50),
      ),
      child: (imageUrl != '' && imageUrl != null)
          ? FadeInImage(
              placeholder: const AssetImage('assets/giphy.gif'),
              image: NetworkImage(imageUrl!),
            )
          : const Image(
              image: AssetImage('assets/no-image.png'),
            ),
    );
  }
}
