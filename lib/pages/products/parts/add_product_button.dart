import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_admin/helpers/methods/navigation.dart';
import 'package:skar_admin/models/brend.dart';
import 'package:skar_admin/pages/add_or_update_product/add_or_update_product.dart';
import 'package:skar_admin/providers/pages/add_or_update_product.dart';
import 'package:skar_admin/providers/pages/brend.dart';
import 'package:skar_admin/providers/pages/category.dart';

class AddProductButton extends ConsumerWidget {
  const AddProductButton({super.key, required this.shopID});

  final String shopID;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(0),
          backgroundColor: Colors.green,
        ),
        onPressed: () async {
          await ref.read(productGendersProvider.notifier).removeAllGenders();
          await ref
              .read(selectedCategoriesProvider.notifier)
              .removeAllCategories();
          await ref
              .read(productColorsProvider.notifier)
              .removeAllProductColors();
          ref.read(selectedBrendProvider.notifier).state = Brend.defaultBrend();
          if (context.mounted) {
            goToPage(
              context,
              AddOrUpdateProductPage(shopID: shopID, productID: ''),
              false,
            );
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
