import 'package:flutter/material.dart';
import 'package:skar_admin/models/product.dart';

class ProductListTile extends StatelessWidget {
  const ProductListTile({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Card(child: Text(product.nameTM));
  }
}
