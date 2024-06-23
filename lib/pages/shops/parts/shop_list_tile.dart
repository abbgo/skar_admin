import 'package:flutter/material.dart';
import 'package:skar_admin/models/shop.dart';
import 'package:skar_admin/pages/shops/parts/shop_list_tile_image.dart';

class ShopListTile extends StatelessWidget {
  const ShopListTile({super.key, required this.shop});

  final Shop shop;
  static const double cardHeight = 110.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      height: cardHeight,
      child: Card(
        child: Row(
          children: [
            ShopListTileImage(shop: shop, cardHeight: cardHeight),
            // ShopListTileData(shop: shop, forFavorite: forFavorite),
            // ShopListTileMapButton(
            //   shop: shop,
            //   mapPageContext: mapPageContext,
            //   forFavorite: forFavorite,
            // ),
          ],
        ),
      ),
    );
  }
}
