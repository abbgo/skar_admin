import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_admin/helpers/methods/navigation.dart';
import 'package:skar_admin/models/brend.dart';
import 'package:skar_admin/pages/add_or_update_product/add_or_update_product.dart';
import 'package:skar_admin/pages/parts/floating_button.dart';
import 'package:skar_admin/providers/pages/add_or_update_product.dart';
import 'package:skar_admin/providers/pages/brend.dart';
import 'package:skar_admin/providers/pages/category.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AddOrUpdateProductFloatButton extends ConsumerWidget {
  const AddOrUpdateProductFloatButton({super.key, required this.shopID});

  final String shopID;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var lang = AppLocalizations.of(context)!;

    return FloatingButton(
      onPressed: () async {
        await ref
            .read(selectedCategoriesProvider.notifier)
            .removeAllCategories();
        await ref.read(productColorsProvider.notifier).removeAllProductColors();
        ref.read(selectedBrendProvider.notifier).state = Brend.defaultBrend();
        if (context.mounted) {
          goToPage(
            context,
            AddOrUpdateProductPage(shopID: shopID, productID: ''),
            false,
          );
        }
      },
      text: lang.addNewProduct,
    );
  }
}
