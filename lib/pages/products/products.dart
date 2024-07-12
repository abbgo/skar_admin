import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_admin/datas/static.dart';
import 'package:skar_admin/helpers/static_data.dart';
import 'package:skar_admin/models/product.dart';
import 'package:skar_admin/pages/add_or_update_product/add_or_update_product.dart';
import 'package:skar_admin/pages/parts/floating_button.dart';
import 'package:skar_admin/pages/parts/no_result.dart';
import 'package:skar_admin/pages/parts/product_list_tile/product_list_tile.dart';
import 'package:skar_admin/providers/api/product.dart';
import 'package:skar_admin/providers/pages/products.dart';
import 'package:skar_admin/services/api/product.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProductsPage extends ConsumerWidget {
  const ProductsPage({super.key, required this.shopID});

  final String shopID;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var lang = AppLocalizations.of(context)!;
    bool hasProducts = ref.watch(hasProductsProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(lang.products),
        centerTitle: false,
      ),
      body: !hasProducts
          ? const NoResult()
          : ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                final page = index ~/ pageSize + 1;
                final indexInPage = index % pageSize;

                ProductParams productParams =
                    ProductParams(page: page, isDeleted: false, shopID: shopID);
                final AsyncValue<ResultProduct> products =
                    ref.watch(fetchProductsProvider(productParams));

                return products.when(
                  skipLoadingOnRefresh: true,
                  skipLoadingOnReload: true,
                  skipError: true,
                  data: (response) {
                    if (response.error != '') {
                      return null;
                    }
                    if (indexInPage >= response.products!.length) {
                      return null;
                    }

                    Product product = response.products![indexInPage];
                    return ProductListTile(product: product, shopID: shopID);
                  },
                  error: (error, stackTrace) => errorMethod(error),
                  loading: () => null,
                );
              },
            ),
      floatingActionButton: FloatingButton(
        page: AddOrUpdateProductPage(shopID: shopID, productID: ''),
        text: lang.addNewProduct,
      ),
    );
  }
}
