import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_admin/helpers/methods/navigation.dart';
import 'package:skar_admin/pages/add_or_update_product_color/add_or_update_product_color.dart';
import 'package:skar_admin/pages/parts/floating_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:skar_admin/pages/product_colors/parts/product_colors_body.dart';
import 'package:skar_admin/providers/pages/add_or_update_product.dart';

class ProductColorsPage extends StatelessWidget {
  const ProductColorsPage({super.key});

  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(centerTitle: false, title: Text(lang.productTypes)),
      body: const ProductColorsBody(),
      floatingActionButton: Consumer(
        builder: (context, ref, child) {
          return FloatingButton(
            onPressed: () async {
              await ref
                  .read(selectedDimensionsProvider.notifier)
                  .removeAllDimensions();
              await ref.read(productImagesProvider.notifier).removeAllImages();
              if (context.mounted) {
                goToPage(context, const AddOrUpdateProductColorPage(), false);
              }
            },
            text: lang.addProductType,
          );
        },
      ),
    );
  }
}
