import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_admin/models/product_color.dart';
import 'package:skar_admin/providers/pages/add_or_update_product.dart';

class ProductColorsBody extends ConsumerWidget {
  const ProductColorsBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<ProductColor> productColors = ref.watch(productColorsProvider);

    return ListView.builder(
      itemCount: productColors.length,
      itemBuilder: (context, index) {
        return Card(child: Text(productColors[index].name));
      },
    );
  }
}
