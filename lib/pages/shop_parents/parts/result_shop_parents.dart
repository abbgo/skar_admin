import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar_admin/datas/static.dart';
import 'package:skar_admin/helpers/static_data.dart';
import 'package:skar_admin/models/shop.dart';
import 'package:skar_admin/providers/api/shop.dart';
import 'package:skar_admin/services/api/shop.dart';

class ResultShopParents extends ConsumerWidget {
  const ResultShopParents({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          final page = index ~/ pageSize + 1;
          final indexInPage = index % pageSize;

          ShopParams shopParams = ShopParams(
            page: page,
            isDeleted: false,
            isShoppingCenter: true,
          );
          final AsyncValue<ResultShop> shops =
              ref.watch(fetchShopsProvider(shopParams));

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
              return Card(
                child: ListTile(
                  title: Text(shop.nameTM),
                ),
              );
            },
            error: (error, stackTrace) => errorMethod(error),
            loading: () => null,
          );
        },
      ),
    );
  }
}
