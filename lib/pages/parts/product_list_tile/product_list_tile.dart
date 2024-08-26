import 'package:flutter/material.dart';
import 'package:skar_admin/models/product.dart';
import 'package:skar_admin/pages/parts/list_tile_image.dart';
import 'package:skar_admin/pages/parts/product_list_tile/parts/product_list_tile_data.dart';
import 'package:skar_admin/pages/parts/product_list_tile/parts/product_pop_up_menu.dart';

class ProductListTile extends StatelessWidget {
  const ProductListTile({super.key, required this.product, this.shopID});

  final Product product;
  static const double cardHeight = 120;
  final String? shopID;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      height: cardHeight,
      child: Card(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTileImage(
              imagePath: product.image!,
              cardHeight: cardHeight,
              cardWidth: 80,
            ),
            ProductListTileData(product: product),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 15),
                Icon(
                  product.isVisible! ? Icons.visibility : Icons.visibility_off,
                  color: product.isVisible! ? Colors.green : Colors.red,
                  size: 20,
                ),
                ProductPopUpMenu(productID: product.id!, shopID: shopID),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
