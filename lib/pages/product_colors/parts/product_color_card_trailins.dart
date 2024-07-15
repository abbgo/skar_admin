import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_admin/helpers/methods/navigation.dart';
import 'package:skar_admin/models/product_color.dart';
import 'package:skar_admin/pages/add_product_color/add_product_color.dart';
import 'package:skar_admin/providers/pages/add_or_update_product.dart';

class ProductColorCardTrailins extends ConsumerWidget {
  const ProductColorCardTrailins({super.key, required this.productColor});

  final ProductColor productColor;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          onPressed: () async {
            await ref
                .read(selectedDimensionsProvider.notifier)
                .setDimensions(productColor.selectedDimensions!);
            if (context.mounted) {
              goToPage(
                context,
                AddProductColorPage(productColor: productColor),
                false,
              );
            }
          },
          icon: const Icon(Icons.edit),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.delete_forever),
        ),
      ],
    );
  }
}
