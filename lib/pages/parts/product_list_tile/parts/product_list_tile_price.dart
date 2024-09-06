import 'package:flutter/material.dart';
import 'package:skar_admin/models/product.dart';

class ProductListTilePrice extends StatelessWidget {
  const ProductListTilePrice({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${product.price} TMT',
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
        ),
        const SizedBox(width: 5),
        product.oldPrice == null || product.oldPrice == 0
            ? const SizedBox()
            : Text(
                '${product.oldPrice} TMT',
                style: const TextStyle(
                  decoration: TextDecoration.lineThrough,
                  fontSize: 12,
                ),
              ),
      ],
    );
  }
}
