import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_admin/helpers/static_data.dart';
import 'package:skar_admin/models/product.dart';
import 'package:skar_admin/providers/api/product.dart';
import 'package:skar_admin/services/api/product.dart';

class CountOfProducts extends ConsumerWidget {
  const CountOfProducts({super.key, required this.shopID});

  final String shopID;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ProductParams productParams =
        ProductParams(isDeleted: false, shopID: shopID);
    final AsyncValue<ResultProduct> countOfProducts =
        ref.watch(fetchCountOfProductsProvider(productParams));

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            const Text(
              'Harytlaryn sany: ',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            countOfProducts.when(
              skipLoadingOnRefresh: true,
              skipLoadingOnReload: true,
              skipError: true,
              data: (response) => Text(
                response.count!.toString(),
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              error: (error, stackTrace) => errorMethod(error),
              loading: () => const SizedBox(),
            ),
          ],
        ),
      ),
    );
  }
}
