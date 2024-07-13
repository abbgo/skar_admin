import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_admin/models/product_color.dart';
import 'package:skar_admin/pages/parts/no_result.dart';
import 'package:skar_admin/pages/product_colors/parts/product_color_card.dart';
import 'package:skar_admin/providers/pages/add_or_update_product.dart';

class ProductColorsBody extends ConsumerWidget {
  const ProductColorsBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<ProductColor> productColors = ref.watch(productColorsProvider);

    return productColors.isEmpty
        ? const NoResult()
        : Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ReorderableListView.builder(
              itemBuilder: (context, index) {
                ProductColor productColor = productColors[index];
                return ProductColorCard(
                  productColor: productColor,
                  key: Key(productColor.name),
                );
              },
              itemCount: productColors.length,
              onReorderEnd: (index) =>
                  productColors[index].copyWith(orderNumber: index + 1),
              onReorder: (oldIndex, newIndex) {
                if (newIndex > oldIndex) {
                  newIndex -= 1;
                }
                final ProductColor item = productColors.removeAt(oldIndex);
                productColors.insert(newIndex, item);
              },
            ),
          );
  }
}
