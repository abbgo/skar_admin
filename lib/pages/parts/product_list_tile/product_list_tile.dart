import 'package:flutter/material.dart';
import 'package:skar_admin/models/product.dart';
import 'package:skar_admin/pages/parts/list_tile_image.dart';

class ProductListTile extends StatelessWidget {
  const ProductListTile({super.key, required this.product});

  final Product product;
  static const double cardHeight = 110.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      height: cardHeight,
      child: Card(
        child: Row(
          children: [
            ListTileImage(
              imagePath: product.image!,
              cardHeight: cardHeight,
            ),
            // ShopListTileData(shop: shop),
            // PopUpMenus(shopID: shop.id!),
          ],
        ),
      ),
    );
  }
}
