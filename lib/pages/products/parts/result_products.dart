import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_admin/datas/static.dart';
import 'package:skar_admin/helpers/static_data.dart';
import 'package:skar_admin/models/product.dart';
import 'package:skar_admin/pages/parts/no_result.dart';
import 'package:skar_admin/pages/parts/product_list_tile/product_list_tile.dart';
import 'package:skar_admin/providers/api/product.dart';
import 'package:skar_admin/providers/pages/products.dart';
import 'package:skar_admin/services/api/product.dart';

class ResultProducts extends ConsumerWidget {
  const ResultProducts({super.key, this.shopID});

  final String? shopID;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool hasProducts = ref.watch(hasProductsProvider);
    ScrollController scrollController =
        ref.watch(productsScrollControllerProvider);
    bool loading = ref.watch(loadProductsProvider);

    return Expanded(
      child: Stack(
        children: [
          !hasProducts
              ? const NoResult()
              : ListView.builder(
                  controller: scrollController,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    final page = index ~/ pageSize + 1;
                    final indexInPage = index % pageSize;

                    ProductParams productParams = ProductParams(
                      page: page,
                      isDeleted: shopID != null ? false : true,
                      shopID: shopID,
                      context: context,
                    );
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
                        return ProductListTile(
                            product: product, shopID: shopID);
                      },
                      error: (error, stackTrace) => errorMethod(error),
                      loading: () {
                        if (!loading) {
                          Future.delayed(
                            const Duration(),
                            () => ref
                                .read(loadProductsProvider.notifier)
                                .state = true,
                          );
                        }
                        return null;
                      },
                    );
                  },
                ),
          loading ? loadWidget : const SizedBox(),
        ],
      ),
    );
  }
}
