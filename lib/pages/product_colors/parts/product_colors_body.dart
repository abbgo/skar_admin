import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_admin/models/product_color.dart';
import 'package:skar_admin/pages/product_colors/parts/product_color_card.dart';
import 'package:skar_admin/providers/pages/add_or_update_product.dart';

class ProductColorsBody extends ConsumerWidget {
  const ProductColorsBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<ProductColor> productColors = ref.watch(productColorsProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: ListView.builder(
        itemCount: productColors.length,
        itemBuilder: (context, index) {
          ProductColor productColor = productColors[index];
          return ProductColorCard(productColor: productColor);
        },
      ),
    );
  }
}
