import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_admin/models/product.dart';
import 'package:skar_admin/pages/parts/product_list_tile/parts/product_list_tile_price.dart';
import 'package:skar_admin/pages/parts/product_list_tile/parts/product_list_tile_statuses.dart';
import 'package:skar_admin/providers/local_storadge/setting.dart';

class ProductListTileData extends StatelessWidget {
  const ProductListTileData({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Consumer(
          builder: (context, ref, child) {
            bool isTM = ref.watch(langProvider) == 'tr';

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  isTM ? product.nameTM : product.nameRU,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ProductListTilePrice(product: product),
                    ProductListTileStatuses(product: product),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
