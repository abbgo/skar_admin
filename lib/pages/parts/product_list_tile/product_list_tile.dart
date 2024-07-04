import 'package:flutter/material.dart';
import 'package:skar_admin/models/product.dart';
import 'package:skar_admin/pages/parts/list_tile_image.dart';
import 'package:skar_admin/pages/parts/product_list_tile/parts/product_list_tile_data.dart';

class ProductListTile extends StatelessWidget {
  const ProductListTile({super.key, required this.product});

  final Product product;
  static const double cardHeight = 120.0;

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
            ProductListTileData(product: product),
            // PopUpMenus(shopID: shop.id!),
          ],
        ),
      ),
    );
  }
}
