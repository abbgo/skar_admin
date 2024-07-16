import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_admin/pages/parts/search_input.dart';
import 'package:skar_admin/pages/products/parts/add_or_update_product_button.dart';
import 'package:skar_admin/pages/products/parts/result_products.dart';
import 'package:skar_admin/providers/pages/products.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key, required this.shopID});

  final String shopID;

  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Consumer(
          builder: (context, ref, child) {
            return SearchInput(
              label: lang.searchProduct,
              onSubmitted: (value) {
                ref.read(productSearchProvider.notifier).state = value;
                ref.read(hasProductsProvider.notifier).state = true;
              },
            );
          },
        ),
        centerTitle: false,
      ),
      body: ResultProducts(shopID: shopID),
      floatingActionButton: AddOrUpdateProductFloatButton(shopID: shopID),
    );
  }
}
