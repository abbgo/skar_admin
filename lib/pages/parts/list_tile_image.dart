import 'package:flutter/material.dart';
import 'package:skar_admin/helpers/methods/parts/image.dart';

class ListTileImage extends StatelessWidget {
  const ListTileImage({
    super.key,
    required this.imagePath,
    required this.cardWidth,
    required this.cardHeight,
  });

  final double cardHeight;
  final double cardWidth;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: cardWidth,
      height: cardHeight,
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          bottomLeft: Radius.circular(10),
        ),
        child: showCachImageMethod(imagePath),
      ),
    );
  }
}
