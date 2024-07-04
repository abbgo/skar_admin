import 'package:flutter/material.dart';
import 'package:skar_admin/helpers/methods/parts/image.dart';
import 'package:skar_admin/models/shop.dart';

class ShopListTileImage extends StatelessWidget {
  const ShopListTileImage(
      {super.key, required this.shop, required this.cardHeight});

  final Shop shop;
  final double cardHeight;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: SizedBox(
        height: cardHeight,
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10),
            bottomLeft: Radius.circular(10),
          ),
          child: showCachImageMethod(shop.image!),
        ),
      ),
    );
  }
}
