import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_admin/models/product_color.dart';
import 'package:skar_admin/pages/parts/no_result.dart';
import 'package:skar_admin/pages/product_colors/parts/product_color_card.dart';
import 'package:skar_admin/providers/pages/add_or_update_product.dart';

class ProductColorsBody extends StatefulWidget {
  const ProductColorsBody({super.key});

  @override
  State<ProductColorsBody> createState() => _ProductColorsBodyState();
}

class _ProductColorsBodyState extends State<ProductColorsBody> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        List<ProductColor> productColors = ref.watch(productColorsProvider);

        return productColors.isEmpty
            ? const NoResult()
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: ReorderableListView.builder(
                  itemBuilder: (context, index) {
                    ProductColor productColor = productColors[index];
                    print('-----------------------------------------');
                    print('$index -> ${productColor.name}');

                    return ProductColorCard(
                      productColor: productColor,
                      key: Key(productColor.name),
                    );
                  },
                  itemCount: productColors.length,
                  onReorderEnd: (index) =>
                      productColors[index].copyWith(orderNumber: index + 1),
                  onReorder: (oldIndex, newIndex) {
                    setState(() {
                      if (newIndex > oldIndex) {
                        newIndex -= 1;
                      }
                      print('========= oldIndex: $oldIndex');
                      print('========= newIndex: $newIndex');
                      final ProductColor item =
                          productColors.removeAt(oldIndex);
                      productColors.insert(newIndex, item);
                    });
                  },
                ),
              );
      },
    );
  }
}
