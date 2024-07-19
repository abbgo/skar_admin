import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_admin/datas/static.dart';
import 'package:skar_admin/helpers/static_data.dart';
import 'package:skar_admin/models/shop.dart';
import 'package:skar_admin/pages/parts/no_result.dart';
import 'package:skar_admin/pages/parts/shop_list_tile/shop_list_tile.dart';
import 'package:skar_admin/providers/api/shop.dart';
import 'package:skar_admin/providers/pages/shops.dart';
import 'package:skar_admin/services/api/shop.dart';

class ResultShops extends ConsumerWidget {
  const ResultShops({super.key, required this.isDeleted});

  final bool isDeleted;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool hasShops = ref.watch(hasShopsProvider);

    return !hasShops
        ? const NoResult()
        : ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              final page = index ~/ pageSize + 1;
              final indexInPage = index % pageSize;

              ShopParams shopParams = ShopParams(
                page: page,
                isDeleted: isDeleted,
                context: context,
              );
              final AsyncValue<ResultShop> shops = isDeleted
                  ? ref.watch(fetchDeletedShopsProvider(shopParams))
                  : ref.watch(fetchShopsProvider(shopParams));

              return shops.when(
                skipLoadingOnRefresh: true,
                skipLoadingOnReload: true,
                skipError: true,
                data: (response) {
                  if (response.error != '') {
                    return null;
                  }
                  if (indexInPage >= response.shops!.length) {
                    return null;
                  }
                  Shop shop = response.shops![indexInPage];
                  return ShopListTile(shop: shop, isDeleted: isDeleted);
                },
                error: (error, stackTrace) => errorMethod(error),
                loading: () => null,
              );
            },
          );
  }
}
