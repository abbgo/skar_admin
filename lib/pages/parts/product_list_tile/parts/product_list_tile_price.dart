import 'package:flutter/material.dart';
import 'package:skar_admin/models/product.dart';

class ProductListTilePrice extends StatelessWidget {
  const ProductListTilePrice({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          '${product.price} man',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(width: 5),
        Text(
          product.oldPrice == null || product.oldPrice == 0
              ? ''
              : '${product.oldPrice} man',
          style: const TextStyle(
            decoration: TextDecoration.lineThrough,
          ),
        ),
      ],
    );
  }
}
